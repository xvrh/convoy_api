# convoy_api

A Dart client for the [Convoy](https://getconvoy.io) webhooks gateway, generated
from Convoy's official OpenAPI specification.

## Usage

```dart
import 'package:convoy_api/convoy_api.dart';
import 'package:http/http.dart';

Future<void> main() async {
  final httpClient = Client();
  final api = ConvoyClient(
    httpClient,
    Uri.parse('http://localhost:5005/api'),
    apiKey: 'YOUR_PROJECT_API_KEY',
  );

  final created = await api.createEndpoint(
    projectId: 'YOUR_PROJECT_ID',
    body: ModelsCreateEndpoint(
      name: 'customer-42-webhook',
      url: 'https://customer.example.com/webhook',
      ownerId: 'customer-42',
    ),
  );
  print(created);

  httpClient.close();
}
```

The base URL must include the `/api` path segment. The client prepends
`Bearer ` to the API key automatically.

## Regenerating the client

The client is generated from `tool/convoy-openapi.json`. To refresh it against a
newer spec:

```bash
dart tool/download.dart        # fetches the latest spec
dart tool/generate_client.dart # regenerates lib/src/api_generated.dart
```

## Running the tests

The test suite runs against a real Convoy instance via Docker Compose. Start the
stack (Postgres + Redis + Convoy server + Convoy agent):

```bash
docker compose -f test/docker-compose.yml up --wait
```

Then run the tests:

```bash
CONVOY_BASE_URL=http://localhost:5005 dart test
```

The first run bootstraps a superuser, organisation, and "smoke" project via
Convoy's admin UI API and caches the resulting credentials to
`test/.convoy-bootstrap.json` so subsequent runs are fast.

To tear the stack down:

```bash
docker compose -f test/docker-compose.yml down --volumes
```
