import '../test/utils.dart';

/// Seeds `test/.convoy-bootstrap.json` before the test isolates spin up in
/// parallel. Without this, every isolate races to regenerate the project API
/// key and the last one to win invalidates everyone else's key.
Future<void> main() async {
  final creds = await bootstrapConvoy();
  print('Bootstrapped project ${creds.projectId}');
}
