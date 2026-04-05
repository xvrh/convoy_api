import 'dart:convert';
import 'dart:io';
import 'package:dart_style/dart_style.dart';
import 'download.dart' show specFile;
import 'open_api/dart.dart' as dart;
import 'open_api/swagger_spec.dart';

// ignore_for_file: avoid_dynamic_calls

void main() {
  var jsonSpec = jsonDecode(specFile.readAsStringSync()) as Map<String, dynamic>;

  final spec = Spec.fromJson(jsonSpec);

    var apiGenerator = dart.Api(
      'Convoy',
      spec,
    );
    var code = apiGenerator.toCode();
    try {
      code = DartFormatter(
        languageVersion: DartFormatter.latestLanguageVersion,
      ).format(code);
    } catch (e) {
      print('Code has syntax error');
    }

    File('lib/src/api_generated.dart').writeAsStringSync(code);
}

