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

  test('Create event type with JSON schema and get it back', () async {
    final schema = {
      'type': 'object',
      'properties': {
        'invoice_id': {'type': 'string'},
        'amount': {'type': 'integer'},
      },
      'required': ['invoice_id', 'amount'],
    };

    final name = randomName('evt-type');
    final created = await api.createEventType(
      projectId: projectId,
      body: ModelsCreateEventType(
        name: name,
        category: 'billing',
        description: 'Test event type with schema',
        jsonSchema: schema,
      ),
    );

    expect(created.name, name);
    expect(created.category, 'billing');
    expect(created.jsonSchema, isA<Map<String, Object?>>());
    expect(created.jsonSchema!['type'], 'object');
    expect(
      (created.jsonSchema!['properties'] as Map)['invoice_id'],
      {'type': 'string'},
    );

    // Verify round-trip via list endpoint.
    final types = await api.getEventTypes(projectId);
    final fetched = types.firstWhere((t) => t.name == name);
    expect(fetched.jsonSchema, created.jsonSchema);
  });
}