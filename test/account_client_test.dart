import 'package:convoy_api/convoy_api.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

import 'utils.dart';

/// Default superuser credentials (created by Convoy on first boot).
const _superuserEmail = 'superuser@default.com';
const _superuserPassword = 'default';

void main() {
  late Client httpClient;
  late ConvoyAccountClient accountClient;

  setUp(() {
    httpClient = Client();
    accountClient = ConvoyAccountClient(httpClient, convoyBaseUrl);
  });

  tearDown(() => httpClient.close());

  test('register returns user data or fails with user-limit error', () async {
    // OSS Convoy limits to a single user. If the superuser already exists
    // this will return a 400 — that's expected. On a fresh instance it
    // should succeed.
    try {
      final result = await accountClient.register(
        email: '${randomName('user')}@test.local',
        password: 'Test1234!',
        firstName: 'Test',
        lastName: 'User',
        organisationName: randomName('org'),
      );
      expect(result.userId, isNotEmpty);
      expect(result.accessToken, isNotEmpty);
    } on ApiException catch (e) {
      // OSS user-limit error is expected when a user already exists.
      expect(e.statusCode, 400);
    }
  });

  test('login and list organisations', () async {
    final loginResult = await accountClient.login(
      username: _superuserEmail,
      password: _superuserPassword,
    );
    expect(loginResult.userId, isNotEmpty);
    expect(loginResult.accessToken, isNotEmpty);

    final orgs = await accountClient.listOrganisations(
      accessToken: loginResult.accessToken,
    );
    expect(orgs, isNotEmpty);
    expect(orgs.first.uid, isNotEmpty);
    expect(orgs.first.name, isNotEmpty);
  });

  test('list projects and create personal API key', () async {
    // Login.
    final loginResult = await accountClient.login(
      username: _superuserEmail,
      password: _superuserPassword,
    );
    final token = loginResult.accessToken;
    final userId = loginResult.userId;

    // Get the organisation.
    final orgs = await accountClient.listOrganisations(accessToken: token);
    final orgId = orgs.first.uid;

    // Reuse an existing project (the bootstrap helper from other tests may
    // have already created one, and OSS Convoy has a project limit).
    var projects = await accountClient.listProjects(
      accessToken: token,
      organisationId: orgId,
    );

    late Project project;
    if (projects.isEmpty) {
      // No project yet — create one.
      project = await accountClient.createProject(
        accessToken: token,
        organisationId: orgId,
        name: randomName('proj'),
      );
    } else {
      project = projects.first;
    }
    expect(project.uid, isNotEmpty);

    // Re-list and verify.
    projects = await accountClient.listProjects(
      accessToken: token,
      organisationId: orgId,
    );
    expect(projects.any((p) => p.uid == project.uid), isTrue);

    // Create a personal API key for the project.
    final apiKey = await accountClient.createPersonalApiKey(
      accessToken: token,
      userId: userId,
      name: randomName('key'),
      expiration: 30,
      projectId: project.uid,
    );
    expect(apiKey.key, isNotEmpty);

    // Use the API key with the existing ConvoyClient to verify it works.
    final convoyClient = ConvoyClient(
      httpClient,
      convoyBaseUrl,
      apiKey: apiKey.key,
    );
    final endpoints = await convoyClient.getEndpoints(
      projectId: project.uid,
    );
    expect(endpoints, isNotNull);
  });

  test('create and list personal API keys', () async {
    final loginResult = await accountClient.login(
      username: _superuserEmail,
      password: _superuserPassword,
    );
    final token = loginResult.accessToken;
    final userId = loginResult.userId;

    // Get or create a project.
    final orgs = await accountClient.listOrganisations(accessToken: token);
    final orgId = orgs.first.uid;
    var projects = await accountClient.listProjects(
      accessToken: token,
      organisationId: orgId,
    );
    late Project project;
    if (projects.isEmpty) {
      project = await accountClient.createProject(
        accessToken: token,
        organisationId: orgId,
        name: randomName('proj'),
      );
    } else {
      project = projects.first;
    }

    // Create a key with a known name.
    final keyName = randomName('listkey');
    await accountClient.createPersonalApiKey(
      accessToken: token,
      userId: userId,
      name: keyName,
      expiration: 30,
      projectId: project.uid,
    );

    // List keys and verify it appears.
    final keys = await accountClient.listPersonalApiKeys(
      accessToken: token,
      userId: userId,
    );
    final match = keys.where((k) => k.name == keyName).toList();
    expect(match, hasLength(1));
    expect(match.first.uid, isNotEmpty);
    expect(match.first.expiresAt, isNotEmpty);
  });

  test('revoke personal API key', () async {
    final loginResult = await accountClient.login(
      username: _superuserEmail,
      password: _superuserPassword,
    );
    final token = loginResult.accessToken;
    final userId = loginResult.userId;

    // Get or create a project.
    final orgs = await accountClient.listOrganisations(accessToken: token);
    final orgId = orgs.first.uid;
    var projects = await accountClient.listProjects(
      accessToken: token,
      organisationId: orgId,
    );
    late Project project;
    if (projects.isEmpty) {
      project = await accountClient.createProject(
        accessToken: token,
        organisationId: orgId,
        name: randomName('proj'),
      );
    } else {
      project = projects.first;
    }

    // Create a key.
    final keyName = randomName('revkey');
    await accountClient.createPersonalApiKey(
      accessToken: token,
      userId: userId,
      name: keyName,
      expiration: 30,
      projectId: project.uid,
    );

    // Verify it appears in the list.
    var keys = await accountClient.listPersonalApiKeys(
      accessToken: token,
      userId: userId,
    );
    final created = keys.firstWhere((k) => k.name == keyName);

    // Revoke it.
    await accountClient.revokePersonalApiKey(
      accessToken: token,
      userId: userId,
      keyId: created.uid,
    );

    // Verify it's gone from the list.
    keys = await accountClient.listPersonalApiKeys(
      accessToken: token,
      userId: userId,
    );
    expect(keys.any((k) => k.uid == created.uid), isFalse);
  });
}
