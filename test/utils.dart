import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:convoy_api/convoy_api.dart';
import 'package:http/http.dart';

/// Host for the Convoy server under test (set via `CONVOY_BASE_URL` env).
final Uri convoyBaseUrl = Uri.parse(
  Platform.environment['CONVOY_BASE_URL'] ?? 'http://localhost:5005',
);

/// Hostname that containers use to reach services running on the test host.
const hostFromDocker = 'host.docker.internal';

const _superuserEmail = 'superuser@default.com';
const _superuserPassword = 'default';

final File _bootstrapCache = File('test/.convoy-bootstrap.json');

/// Bootstrapped credentials for the project the tests run against.
class ConvoyCredentials {
  final String projectId;
  final String apiKey;
  ConvoyCredentials(this.projectId, this.apiKey);
}

ConvoyCredentials? _credentials;

/// Logs in as the default superuser, creates an org + project, and caches the
/// resulting API key. Reused across test runs.
Future<ConvoyCredentials> bootstrapConvoy() async {
  if (_credentials != null) return _credentials!;

  if (_bootstrapCache.existsSync()) {
    final cached =
        jsonDecode(_bootstrapCache.readAsStringSync()) as Map<String, Object?>;
    final creds = ConvoyCredentials(
      cached['project_id'] as String,
      cached['api_key'] as String,
    );
    if (await _apiKeyWorks(creds)) {
      return _credentials = creds;
    }
  }

  final client = Client();
  try {
    final account = ConvoyAccountClient(client, convoyBaseUrl);

    final login = await account.login(
      username: _superuserEmail,
      password: _superuserPassword,
    );
    final token = login.accessToken;
    final userId = login.userId;

    // Reuse an existing organisation if present (OSS Convoy limits to one).
    final orgs = await account.listOrganisations(accessToken: token);
    String orgId;
    if (orgs.isNotEmpty) {
      orgId = orgs.first.uid;
    } else {
      final org = await account.createOrganisation(
        accessToken: token,
        name: 'convoy-api-smoke-tests',
      );
      orgId = org.uid;
    }

    // Reuse an existing "smoke" project if present.
    final projects = await account.listProjects(
      accessToken: token,
      organisationId: orgId,
    );
    final existing = projects.where((p) => p.name == 'smoke').firstOrNull;
    String projectId;
    if (existing != null) {
      projectId = existing.uid;
    } else {
      final project = await account.createProject(
        accessToken: token,
        organisationId: orgId,
        name: 'smoke',
      );
      projectId = project.uid;
    }

    // Create a personal API key for the project.
    final apiKey = await account.createPersonalApiKey(
      accessToken: token,
      userId: userId,
      name: 'smoke-${DateTime.now().millisecondsSinceEpoch}',
      expiration: 30,
      projectId: projectId,
    );

    final creds = ConvoyCredentials(projectId, apiKey.key);
    _bootstrapCache.writeAsStringSync(
      jsonEncode({'project_id': creds.projectId, 'api_key': creds.apiKey}),
    );
    return _credentials = creds;
  } finally {
    client.close();
  }
}

Future<bool> _apiKeyWorks(ConvoyCredentials creds) async {
  final client = Client();
  try {
    final api = ConvoyClient(client, convoyBaseUrl, apiKey: creds.apiKey);
    await api.getEndpoints(projectId: creds.projectId, perPage: 1);
    return true;
  } catch (_) {
    return false;
  } finally {
    client.close();
  }
}

/// Create a fresh [ConvoyClient] + owning [Client] already bootstrapped with
/// credentials. The caller owns the [Client] and must close it.
Future<({ConvoyClient api, Client httpClient, String projectId})>
makeConvoyClient() async {
  final creds = await bootstrapConvoy();
  final httpClient = Client();
  final api = ConvoyClient(httpClient, convoyBaseUrl, apiKey: creds.apiKey);
  return (api: api, httpClient: httpClient, projectId: creds.projectId);
}

final _rand = Random();
int _seq = 0;
String randomName(String prefix) =>
    '$prefix-${DateTime.now().millisecondsSinceEpoch}-${++_seq}-${_rand.nextInt(99999)}';

/// Poll [check] until it returns non-null, or throw on timeout.
Future<T> waitFor<T>(
  Future<T?> Function() check, {
  Duration timeout = const Duration(seconds: 30),
  Duration interval = const Duration(milliseconds: 300),
  String description = 'condition',
}) async {
  final deadline = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(deadline)) {
    final result = await check();
    if (result != null) return result;
    await Future<void>.delayed(interval);
  }
  throw TimeoutException('Timed out waiting for $description');
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);
  @override
  String toString() => 'TimeoutException: $message';
}
