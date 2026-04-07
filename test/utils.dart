import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:convoy_api/convoy_api.dart';
import 'package:http/http.dart';

/// Host for the Convoy server under test (set via `CONVOY_BASE_URL` env).
final Uri convoyBaseUrl = Uri.parse(
  Platform.environment['CONVOY_BASE_URL'] ?? 'http://localhost:5005',
);

/// Base URL for the public Convoy API (prefixed with `/api`).
///
/// Used only by internal helpers that make raw HTTP calls. Client code should
/// pass [convoyBaseUrl] to both [ConvoyClient] and [ConvoyAccountClient] — the
/// clients prepend the correct path prefix internally.
Uri get convoyApiBaseUrl =>
    convoyBaseUrl.replace(path: '${convoyBaseUrl.path}/api');

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
    final loginResp = await client.post(
      convoyBaseUrl.replace(path: '/ui/auth/login'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode({
        'username': _superuserEmail,
        'password': _superuserPassword,
      }),
    );
    if (loginResp.statusCode != 200) {
      throw StateError(
        'Convoy login failed (${loginResp.statusCode}): ${loginResp.body}',
      );
    }
    final token =
        ((jsonDecode(loginResp.body)
                    as Map<String, Object?>)['data']
                as Map<String, Object?>)['token']
            as Map<String, Object?>;
    final accessToken = token['access_token'] as String;

    // Reuse an existing organisation if present (OSS Convoy limits to one).
    final orgListResp = await client.get(
      convoyBaseUrl.replace(path: '/ui/organisations'),
      headers: {'authorization': 'Bearer $accessToken'},
    );
    if (orgListResp.statusCode != 200) {
      throw StateError(
        'List organisations failed (${orgListResp.statusCode}): ${orgListResp.body}',
      );
    }
    final existingOrgs =
        (((jsonDecode(orgListResp.body) as Map<String, Object?>)['data']
                    as Map<String, Object?>)['content']
                as List)
            .cast<Map<String, Object?>>();
    String orgId;
    if (existingOrgs.isNotEmpty) {
      orgId = existingOrgs.first['uid'] as String;
    } else {
      final orgResp = await client.post(
        convoyBaseUrl.replace(path: '/ui/organisations'),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({'name': 'convoy-api-smoke-tests'}),
      );
      if (orgResp.statusCode != 201 && orgResp.statusCode != 200) {
        throw StateError(
          'Create organisation failed (${orgResp.statusCode}): ${orgResp.body}',
        );
      }
      orgId =
          ((jsonDecode(orgResp.body) as Map<String, Object?>)['data']
              as Map<String, Object?>)['uid']
          as String;
    }

    // Reuse an existing "smoke" project if present.
    final projectListResp = await client.get(
      convoyBaseUrl.replace(path: '/ui/organisations/$orgId/projects'),
      headers: {'authorization': 'Bearer $accessToken'},
    );
    if (projectListResp.statusCode != 200) {
      throw StateError(
        'List projects failed (${projectListResp.statusCode}): ${projectListResp.body}',
      );
    }
    final existingProjects =
        ((jsonDecode(projectListResp.body)
                    as Map<String, Object?>)['data']
                as List)
            .cast<Map<String, Object?>>();
    final existing = existingProjects
        .where((p) => p['name'] == 'smoke')
        .firstOrNull;
    String projectId;
    String apiKey;
    if (existing != null) {
      projectId = existing['uid'] as String;
      final regenResp = await client.put(
        convoyBaseUrl.replace(
          path:
              '/ui/organisations/$orgId/projects/$projectId/security/keys/regenerate',
        ),
        headers: {'authorization': 'Bearer $accessToken'},
      );
      if (regenResp.statusCode != 200) {
        throw StateError(
          'Regenerate API key failed (${regenResp.statusCode}): ${regenResp.body}',
        );
      }
      apiKey =
          ((jsonDecode(regenResp.body) as Map<String, Object?>)['data']
              as Map<String, Object?>)['key']
          as String;
    } else {
      final projectResp = await client.post(
        convoyBaseUrl.replace(path: '/ui/organisations/$orgId/projects'),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          'name': 'smoke',
          'type': 'outgoing',
          'config': {
            'strategy': {'type': 'linear', 'duration': 1, 'retry_count': 2},
            'signature': {'header': 'X-Convoy-Signature', 'versions': []},
            'ratelimit': {'count': 5000, 'duration': 60},
          },
        }),
      );
      if (projectResp.statusCode != 201 && projectResp.statusCode != 200) {
        throw StateError(
          'Create project failed (${projectResp.statusCode}): ${projectResp.body}',
        );
      }
      final projectBody =
          (jsonDecode(projectResp.body) as Map<String, Object?>)['data']
              as Map<String, Object?>;
      projectId =
          (projectBody['project'] as Map<String, Object?>)['uid'] as String;
      apiKey =
          (projectBody['api_key'] as Map<String, Object?>)['key'] as String;
    }
    final creds = ConvoyCredentials(projectId, apiKey);

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
    final resp = await client.get(
      convoyApiBaseUrl.replace(
        path:
            '${convoyApiBaseUrl.path}/v1/projects/${creds.projectId}/endpoints',
        queryParameters: {'perPage': '1'},
      ),
      headers: {'Authorization': 'Bearer ${creds.apiKey}'},
    );
    return resp.statusCode == 200;
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
  final api = ConvoyClient(
    httpClient,
    convoyBaseUrl,
    apiKey: creds.apiKey,
  );
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
