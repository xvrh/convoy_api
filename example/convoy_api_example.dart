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
