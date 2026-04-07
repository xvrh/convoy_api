import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

  test('Send event end-to-end: endpoint, subscription, createEvent, delivery', () async {
    // 1. Start a local HTTP server that Convoy (in docker) can reach via
    // host.docker.internal, and record the payloads it receives.
    final receiver = await _LocalReceiver.start();
    addTearDown(receiver.close);

    // 2. Create an endpoint pointing at the local receiver.
    final endpoint = await api.createEndpoint(
      projectId: projectId,
      body: ModelsCreateEndpoint(
        name: randomName('event-endpoint'),
        url: 'http://$hostFromDocker:${receiver.port}/hook',
        ownerId: 'owner-${randomName('event')}',
      ),
    );
    final endpointId = endpoint.uid!;
    addTearDown(() async {
      try {
        await api.deleteEndpoint(
          projectId: projectId,
          endpointId: endpointId,
        );
      } catch (_) {}
    });

    // 3. Subscribe the endpoint.
    final sub = await api.createSubscription(
      projectId: projectId,
      body: ModelsCreateSubscription(
        name: randomName('event-sub'),
        endpointId: endpointId,
      ),
    );
    expect(sub.uid, isNotEmpty);

    // 4. Send an event. createEndpointEvent returns {status, message, data:200}
    //    rather than the event body — the event is queued asynchronously and
    //    visible via the events/deliveries lists a moment later.
    final payload = {
      'invoice_id': randomName('inv'),
      'amount': 4242,
      'currency': 'usd',
    };
    await api.createEndpointEvent(
      projectId: projectId,
      body: ModelsCreateEvent(
        endpointId: endpointId,
        eventType: 'invoice.paid',
        data: payload,
      ),
    );

    // 5. Wait for Convoy to deliver it to our local receiver.
    final delivery = await waitFor(
      () async => receiver.requests.isNotEmpty ? receiver.requests.first : null,
      timeout: const Duration(seconds: 30),
      description: 'webhook delivery to local receiver',
    );

    // 6. The body Convoy POSTs is exactly the event data payload.
    expect(jsonDecode(delivery.body), equals(payload));
    expect(
      delivery.headers['x-convoy-signature'],
      isNotNull,
      reason: 'Convoy should sign deliveries with the project secret',
    );

    // 7. The event delivery is visible via the public API as Success.
    final deliveryStatus = await waitFor(
      () async {
        final resp = await api.getEventDeliveriesPaged(
          projectId: projectId,
          endpointId: [endpointId],
        );
        if (resp.content.isEmpty) return null;
        final status = resp.content.first.status;
        return status == DatastoreEventDeliveryStatus.success ? status : null;
      },
      description: 'event delivery status=Success',
    );
    expect(deliveryStatus, DatastoreEventDeliveryStatus.success);
  });
}

class _ReceivedRequest {
  final String body;
  final Map<String, String> headers;
  _ReceivedRequest(this.body, this.headers);
}

class _LocalReceiver {
  final HttpServer _server;
  final List<_ReceivedRequest> requests = [];

  _LocalReceiver._(this._server);

  int get port => _server.port;

  static Future<_LocalReceiver> start() async {
    final server = await HttpServer.bind(InternetAddress.anyIPv4, 0);
    final receiver = _LocalReceiver._(server);
    unawaited(receiver._serve());
    return receiver;
  }

  Future<void> _serve() async {
    await for (final req in _server) {
      final body = await utf8.decoder.bind(req).join();
      final headers = <String, String>{};
      req.headers.forEach((name, values) {
        headers[name.toLowerCase()] = values.join(',');
      });
      requests.add(_ReceivedRequest(body, headers));
      req.response.statusCode = 200;
      req.response.headers.contentType = ContentType.json;
      req.response.write('{"ok":true}');
      await req.response.close();
    }
  }

  Future<void> close() => _server.close(force: true);
}
