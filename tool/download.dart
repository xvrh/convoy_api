import 'dart:io';

import 'package:http/http.dart';

final _specUrl = Uri.parse(
  'https://raw.githubusercontent.com/frain-dev/convoy/refs/heads/main/docs/v3/openapi3.json',
);

final specFile = File('tool/convoy_api.json');

void main() async {
  var content = await read(_specUrl);
  await specFile.writeAsString(content);
}
