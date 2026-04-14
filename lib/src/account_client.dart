import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_utils.dart';

/// Response from the register endpoint.
class RegisterResponse {
  final String userId;
  final String accessToken;

  RegisterResponse({required this.userId, required this.accessToken});
}

/// Response from the login endpoint.
class LoginResponse {
  final String userId;
  final String accessToken;

  LoginResponse({required this.userId, required this.accessToken});
}

/// A Convoy organisation.
class Organisation {
  final String uid;
  final String name;

  Organisation({required this.uid, required this.name});
}

/// A Convoy project.
class Project {
  final String uid;
  final String name;

  Project({required this.uid, required this.name});
}

/// One entry in a project's signature versions list.
class SignatureVersion {
  /// Hash algorithm, e.g. `SHA256`, `SHA512`.
  final String hash;

  /// Encoding of the signature, e.g. `hex`, `base64`.
  final String encoding;

  SignatureVersion({required this.hash, required this.encoding});
}

/// A project's signature configuration, as returned by Convoy.
class ProjectSignatureConfig {
  /// Header name the signature is sent under (e.g. `X-Signature`).
  final String header;
  final List<SignatureVersion> versions;

  ProjectSignatureConfig({required this.header, required this.versions});
}

/// A personal API key (returned by create).
class PersonalApiKey {
  final String key;

  PersonalApiKey({required this.key});
}

/// A personal API key with metadata (returned by list).
class PersonalApiKeyInfo {
  final String uid;
  final String name;
  final String keyType;
  final String? expiresAt;

  PersonalApiKeyInfo({
    required this.uid,
    required this.name,
    required this.keyType,
    this.expiresAt,
  });
}

/// Client for Convoy account-management endpoints that are not part of the
/// generated datastore API: user registration, login, project management,
/// and personal API key creation.
///
/// Unlike [ConvoyClient], this client does not take an API key at construction
/// time. Authentication is done per-request via a Bearer token obtained from
/// the [login] method.
class ConvoyAccountClient {
  final http.Client _httpClient;
  final Uri _baseUri;

  /// Creates a new account client.
  ///
  /// [baseUri] should be the root of the Convoy server
  /// (e.g. `http://localhost:5005`), **not** the `/api` sub-path.
  ConvoyAccountClient(http.Client httpClient, Uri baseUri)
    : _httpClient = httpClient,
      _baseUri = baseUri;

  /// Register a new user.
  Future<RegisterResponse> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String organisationName,
  }) async {
    final body = await _send(
      'POST',
      '/ui/auth/register',
      body: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'org_name': organisationName,
      },
    );
    final data = body['data'] as Map<String, Object?>;
    final token = data['token'] as Map<String, Object?>;
    return RegisterResponse(
      userId: data['uid'] as String,
      accessToken: token['access_token'] as String,
    );
  }

  /// Log in with an existing user. Returns the user ID and access token.
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    final body = await _send(
      'POST',
      '/ui/auth/login',
      body: {'username': username, 'password': password},
    );
    final data = body['data'] as Map<String, Object?>;
    final token = data['token'] as Map<String, Object?>;
    return LoginResponse(
      userId: data['uid'] as String,
      accessToken: token['access_token'] as String,
    );
  }

  /// List organisations visible to the authenticated user.
  Future<List<Organisation>> listOrganisations({
    required String accessToken,
  }) async {
    final body = await _send(
      'GET',
      '/ui/organisations',
      accessToken: accessToken,
    );
    final content =
        ((body['data'] as Map<String, Object?>)['content'] as List)
            .cast<Map<String, Object?>>();
    return [
      for (final item in content)
        Organisation(
          uid: item['uid'] as String,
          name: item['name'] as String,
        ),
    ];
  }

  /// Create a new organisation.
  Future<Organisation> createOrganisation({
    required String accessToken,
    required String name,
  }) async {
    final body = await _send(
      'POST',
      '/ui/organisations',
      accessToken: accessToken,
      body: {'name': name},
    );
    final data = body['data'] as Map<String, Object?>;
    return Organisation(
      uid: data['uid'] as String,
      name: data['name'] as String,
    );
  }

  /// List projects in an organisation.
  Future<List<Project>> listProjects({
    required String accessToken,
    required String organisationId,
  }) async {
    final orgId = Uri.encodeComponent(organisationId);
    final body = await _send(
      'GET',
      '/ui/organisations/$orgId/projects',
      accessToken: accessToken,
    );
    final items = (body['data'] as List).cast<Map<String, Object?>>();
    return [
      for (final item in items)
        Project(uid: item['uid'] as String, name: item['name'] as String),
    ];
  }

  /// Create a new project in an organisation.
  Future<Project> createProject({
    required String accessToken,
    required String organisationId,
    required String name,
    String type = 'outgoing',
  }) async {
    final orgId = Uri.encodeComponent(organisationId);
    final body = await _send(
      'POST',
      '/ui/organisations/$orgId/projects',
      accessToken: accessToken,
      body: {'name': name, 'type': type},
    );
    final data = body['data'] as Map<String, Object?>;
    // The create-project response nests the project under a "project" key.
    final project =
        data.containsKey('project')
            ? data['project'] as Map<String, Object?>
            : data;
    return Project(
      uid: project['uid'] as String,
      name: project['name'] as String,
    );
  }

  /// Get a project's current signature configuration.
  Future<ProjectSignatureConfig> getProjectSignatureConfig({
    required String accessToken,
    required String organisationId,
    required String projectId,
  }) async {
    final orgId = Uri.encodeComponent(organisationId);
    final pid = Uri.encodeComponent(projectId);
    final body = await _send(
      'GET',
      '/ui/organisations/$orgId/projects/$pid',
      accessToken: accessToken,
    );
    return _readSignatureConfig(body);
  }

  /// Update a project's configuration (signature settings, etc.).
  ///
  /// Convoy's PUT endpoint requires [name]; callers typically pass the
  /// project's existing name to leave it unchanged. Returns the updated
  /// signature configuration as reported by the server.
  Future<ProjectSignatureConfig> updateProjectConfig({
    required String accessToken,
    required String organisationId,
    required String projectId,
    required String name,
    String? signatureHeader,
    List<SignatureVersion>? signatureVersions,
  }) async {
    final orgId = Uri.encodeComponent(organisationId);
    final pid = Uri.encodeComponent(projectId);

    // Convoy's PUT replaces the whole config and enforces NOT NULL on several
    // nested fields, so fetch the current config and merge the signature on
    // top rather than sending a sparse payload.
    final current = await _send(
      'GET',
      '/ui/organisations/$orgId/projects/$pid',
      accessToken: accessToken,
    );
    final currentData = current['data'] as Map<String, Object?>;
    final config = Map<String, Object?>.from(
      (currentData['config'] as Map<String, Object?>?) ?? const {},
    );
    final signature = Map<String, Object?>.from(
      (config['signature'] as Map<String, Object?>?) ?? const {},
    );
    if (signatureHeader != null) signature['header'] = signatureHeader;
    if (signatureVersions != null) {
      signature['versions'] = [
        for (final v in signatureVersions)
          {'hash': v.hash, 'encoding': v.encoding},
      ];
    }
    config['signature'] = signature;

    final body = await _send(
      'PUT',
      '/ui/organisations/$orgId/projects/$pid',
      accessToken: accessToken,
      body: {'name': name, 'config': config},
    );
    return _readSignatureConfig(body);
  }

  /// Create a personal API key scoped to a project.
  Future<PersonalApiKey> createPersonalApiKey({
    required String accessToken,
    required String userId,
    required String name,
    required int expiration,
    required String projectId,
  }) async {
    final uid = Uri.encodeComponent(userId);
    final body = await _send(
      'POST',
      '/ui/users/$uid/security/personal_api_keys',
      accessToken: accessToken,
      body: {
        'name': name,
        'expiration': expiration,
        'role': {'type': 'admin', 'project': projectId},
      },
    );
    final data = body['data'] as Map<String, Object?>;
    return PersonalApiKey(key: data['key'] as String);
  }

  /// List personal API keys for a user.
  Future<List<PersonalApiKeyInfo>> listPersonalApiKeys({
    required String accessToken,
    required String userId,
  }) async {
    final uid = Uri.encodeComponent(userId);
    final body = await _send(
      'GET',
      '/ui/users/$uid/security',
      accessToken: accessToken,
    );
    final data = body['data'] as Map<String, Object?>;
    final items = (data['content'] as List).cast<Map<String, Object?>>();
    return [
      for (final item in items)
        PersonalApiKeyInfo(
          uid: item['uid'] as String,
          name: item['name'] as String,
          keyType: item['key_type'] as String? ?? '',
          expiresAt: item['expires_at'] as String?,
        ),
    ];
  }

  /// Revoke a personal API key.
  Future<void> revokePersonalApiKey({
    required String accessToken,
    required String userId,
    required String keyId,
  }) async {
    final uid = Uri.encodeComponent(userId);
    final kid = Uri.encodeComponent(keyId);
    await _send(
      'PUT',
      '/ui/users/$uid/security/$kid/revoke',
      accessToken: accessToken,
    );
  }

  ProjectSignatureConfig _readSignatureConfig(Map<String, Object?> body) {
    final data = body['data'] as Map<String, Object?>;
    final project =
        data.containsKey('project')
            ? data['project'] as Map<String, Object?>
            : data;
    final config = project['config'] as Map<String, Object?>?;
    final signature = config?['signature'] as Map<String, Object?>?;
    final versions =
        (signature?['versions'] as List? ?? const []).cast<Map<String, Object?>>();
    return ProjectSignatureConfig(
      header: signature?['header'] as String? ?? '',
      versions: [
        for (final v in versions)
          SignatureVersion(
            hash: v['hash'] as String? ?? '',
            encoding: v['encoding'] as String? ?? '',
          ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Internal helpers
  // ---------------------------------------------------------------------------

  Future<Map<String, Object?>> _send(
    String method,
    String path, {
    String? accessToken,
    Map<String, Object?>? body,
  }) async {
    final uri = _baseUri.replace(path: path);
    final request = http.Request(method, uri);

    if (body != null) {
      request.headers['content-type'] = 'application/json';
      request.body = jsonEncode(body);
    }

    if (accessToken != null) {
      request.headers['authorization'] = 'Bearer $accessToken';
    }

    final response = await http.Response.fromStream(
      await _httpClient.send(request),
    );
    ApiException.checkResponse(response);

    if (response.bodyBytes.isEmpty) {
      return <String, Object?>{};
    }
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
  }
}
