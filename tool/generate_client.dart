import 'dart:convert';
import 'dart:io';
import 'package:dart_style/dart_style.dart';
import 'download.dart' show specFile;
import 'open_api/dart.dart' as dart;
import 'open_api/swagger_spec.dart';

// ignore_for_file: avoid_dynamic_calls

void main() {
  var jsonSpec = jsonDecode(specFile.readAsStringSync()) as Map<String, dynamic>;
  _fixSpec(jsonSpec);

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

/// Patch spec inaccuracies before code generation. The downloaded JSON file
/// stays untouched — fixes are applied in-memory only.
void _fixSpec(Map<String, dynamic> spec) {
  final schemas =
      (spec['components'] as Map)['schemas'] as Map<String, dynamic>;

  // datastore.Metadata.data is declared as array<int> but the API actually
  // returns the event payload (a map). Widen to untyped.
  final metadata = schemas['datastore.Metadata'] as Map<String, dynamic>;
  (metadata['properties'] as Map<String, dynamic>)['data'] = {
    'description': 'Data to be sent to endpoint.',
  };

  // models.EventTypeResponse.json_schema is declared as array<int> but the
  // API actually returns a JSON Schema object (a map).
  final eventType =
      schemas['models.EventTypeResponse'] as Map<String, dynamic>;
  (eventType['properties'] as Map<String, dynamic>)['json_schema'] = {
    'type': 'object',
    'description': 'JSON Schema describing the event type payload.',
  };
}

