import 'package:convoy_api/convoy_api.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  late Client httpClient;
  late ConvoyClient api;
  late String projectId;

  setUp(() async {
    final setup = await makeConvoyClient();
    httpClient = setup.httpClient;
    api = setup.api;
    projectId = setup.projectId;
  });

  tearDown(() => httpClient.close());

  test('Create, get, update, pause, activate, delete endpoint', () async {
    final name = randomName('endpoint');
    final created = await api.createEndpoint(
      projectId: projectId,
      body: ModelsCreateEndpoint(
        name: name,
        url: 'http://$hostFromDocker:65535/not-used-for-health',
        description: 'smoke-test endpoint',
        ownerId: 'owner-123',
      ),
    );
    final createdData = (created as Map)['data'] as Map;
    final endpointId = createdData['uid'] as String;
    expect(endpointId, isNotEmpty);
    expect(createdData['name'], name);
    expect(createdData['owner_id'], 'owner-123');

    // GET
    final fetched = await api.getEndpoint(
      projectId: projectId,
      endpointId: endpointId,
    );
    expect(((fetched as Map)['data'] as Map)['uid'], endpointId);

    // UPDATE
    final updatedName = '$name-updated';
    final updated = await api.updateEndpoint(
      projectId: projectId,
      endpointId: endpointId,
      body: ModelsUpdateEndpoint(
        name: updatedName,
        url: 'http://$hostFromDocker:65535/not-used-for-health',
        description: 'updated description',
      ),
    );
    expect(((updated as Map)['data'] as Map)['name'], updatedName);

    // PAUSE (toggle)
    final paused = await api.pauseEndpoint(
      projectId: projectId,
      endpointId: endpointId,
    );
    expect(((paused as Map)['data'] as Map)['status'], 'paused');

    // PAUSE again toggles back to active
    final reactivated = await api.pauseEndpoint(
      projectId: projectId,
      endpointId: endpointId,
    );
    expect(((reactivated as Map)['data'] as Map)['status'], 'active');

    // DELETE
    await api.deleteEndpoint(
      projectId: projectId,
      endpointId: endpointId,
    );
  });

  test('List endpoints by owner_id', () async {
    final ownerId = 'owner-${randomName('list')}';
    // create 2 endpoints for this owner
    for (var i = 0; i < 2; i++) {
      await api.createEndpoint(
        projectId: projectId,
        body: ModelsCreateEndpoint(
          name: randomName('list-endpoint'),
          url: 'http://$hostFromDocker:65535/path-$i',
          ownerId: ownerId,
        ),
      );
    }
    final listed = await api.getEndpoints(
      projectId: projectId,
      ownerId: ownerId,
    );
    final content =
        (((listed as Map)['data'] as Map)['content'] as List).cast<Map>();
    expect(content, hasLength(2));
    expect(content.map((e) => e['owner_id']), everyElement(ownerId));
  });
}
