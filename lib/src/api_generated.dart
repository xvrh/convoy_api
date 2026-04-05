// Generated code - Do not edit manually
library;

import 'api_utils.dart';

// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: use_null_aware_elements

/// Convoy is a fast and secure webhooks proxy. This document contains datastore.s API specification.
class ConvoyClient {
  final ApiClient _client;

  ConvoyClient(Client httpClient, Uri baseUri, {required String? apiKey})
    : _client = ApiClient(baseUri, httpClient, apiKey: apiKey);

  /// This endpoint fetches an endpoints
  Future<dynamic> getEndpoints({
    required String projectId,
    String? direction,
    String? nextPageCursor,
    String? ownerId,
    int? perPage,
    String? prevPageCursor,
    String? q,
    String? sort,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/endpoints',
      pathParameters: {'projectID': projectId},
      queryParameters: {
        if (direction != null) 'direction': direction,
        if (nextPageCursor != null) 'next_page_cursor': nextPageCursor,
        if (ownerId != null) 'ownerId': ownerId,
        if (perPage != null) 'perPage': '$perPage',
        if (prevPageCursor != null) 'prev_page_cursor': prevPageCursor,
        if (q != null) 'q': q,
        if (sort != null) 'sort': sort,
      },
    );
  }

  /// This endpoint creates an endpoint
  Future<dynamic> createEndpoint({
    required String projectId,
    required ModelsCreateEndpoint body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/endpoints',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint tests the OAuth2 connection by attempting to exchange a
  /// token
  Future<dynamic> testoAuth2Connection({
    required String projectId,
    required ModelsTestOAuth2Request body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/endpoints/oauth2/test',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint deletes an endpoint
  Future<dynamic> deleteEndpoint({
    required String projectId,
    required String endpointId,
  }) async {
    return await _client.send(
      'delete',
      'v1/projects/{projectID}/endpoints/{endpointID}',
      pathParameters: {'projectID': projectId, 'endpointID': endpointId},
    );
  }

  /// This endpoint fetches an endpoint
  Future<dynamic> getEndpoint({
    required String projectId,
    required String endpointId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/endpoints/{endpointID}',
      pathParameters: {'projectID': projectId, 'endpointID': endpointId},
    );
  }

  /// This endpoint updates an endpoint
  Future<dynamic> updateEndpoint({
    required String projectId,
    required String endpointId,
    required ModelsUpdateEndpoint body,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/endpoints/{endpointID}',
      pathParameters: {'projectID': projectId, 'endpointID': endpointId},
      body: body.toJson(),
    );
  }

  /// Activated an inactive endpoint
  Future<dynamic> activateEndpoint({
    required String projectId,
    required String endpointId,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/endpoints/{endpointID}/activate',
      pathParameters: {'projectID': projectId, 'endpointID': endpointId},
    );
  }

  /// This endpoint expires and re-generates the endpoint secret.
  Future<dynamic> expireSecret({
    required String projectId,
    required String endpointId,
    required ModelsExpireSecret body,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/endpoints/{endpointID}/expire_secret',
      pathParameters: {'projectID': projectId, 'endpointID': endpointId},
      body: body.toJson(),
    );
  }

  /// Toggles an endpoint's status between active and paused states
  Future<dynamic> pauseEndpoint({
    required String projectId,
    required String endpointId,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/endpoints/{endpointID}/pause',
      pathParameters: {'projectID': projectId, 'endpointID': endpointId},
    );
  }

  /// This endpoint fetches the project's event types
  Future<dynamic> getEventTypes(String projectId) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/event-types',
      pathParameters: {'projectID': projectId},
    );
  }

  /// This endpoint creates an event type
  Future<dynamic> createEventType({
    required String projectId,
    required ModelsCreateEventType body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/event-types',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint imports event types from an OpenAPI specification
  Future<dynamic> importOpenApiSpec({
    required String projectId,
    required ModelsImportOpenAPISpec body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/event-types/import',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint updates an event type
  Future<dynamic> updateEventType({
    required String projectId,
    required ModelsUpdateEventType body,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/event-types/{eventTypeId}',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint deprecates an event type
  Future<dynamic> deprecateEventType({
    required String projectId,
    required String eventTypeId,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/event-types/{eventTypeId}/deprecate',
      pathParameters: {'projectID': projectId, 'eventTypeId': eventTypeId},
    );
  }

  /// This endpoint retrieves all event deliveries paginated.
  Future<dynamic> getEventDeliveriesPaged({
    required String projectId,
    String? direction,
    String? endDate,
    List<String>? endpointId,
    String? eventId,
    String? eventType,
    String? idempotencyKey,
    String? nextPageCursor,
    int? perPage,
    String? prevPageCursor,
    String? sort,
    String? startDate,
    List<String>? status,
    String? subscriptionId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/eventdeliveries',
      pathParameters: {'projectID': projectId},
      queryParameters: {
        if (direction != null) 'direction': direction,
        if (endDate != null) 'endDate': endDate,
        if (endpointId != null)
          'endpointId': endpointId.map((e) => e).join(','),
        if (eventId != null) 'eventId': eventId,
        if (eventType != null) 'event_type': eventType,
        if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
        if (nextPageCursor != null) 'next_page_cursor': nextPageCursor,
        if (perPage != null) 'perPage': '$perPage',
        if (prevPageCursor != null) 'prev_page_cursor': prevPageCursor,
        if (sort != null) 'sort': sort,
        if (startDate != null) 'startDate': startDate,
        if (status != null) 'status': status.map((e) => e).join(','),
        if (subscriptionId != null) 'subscriptionId': subscriptionId,
      },
    );
  }

  /// This endpoint batch retries multiple event deliveries at once.
  Future<dynamic> batchRetryEventDelivery({
    required String projectId,
    String? direction,
    String? endDate,
    List<String>? endpointId,
    String? eventId,
    String? eventType,
    String? idempotencyKey,
    String? nextPageCursor,
    int? perPage,
    String? prevPageCursor,
    String? sort,
    String? startDate,
    List<String>? status,
    String? subscriptionId,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/eventdeliveries/batchretry',
      pathParameters: {'projectID': projectId},
      queryParameters: {
        if (direction != null) 'direction': direction,
        if (endDate != null) 'endDate': endDate,
        if (endpointId != null)
          'endpointId': endpointId.map((e) => e).join(','),
        if (eventId != null) 'eventId': eventId,
        if (eventType != null) 'event_type': eventType,
        if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
        if (nextPageCursor != null) 'next_page_cursor': nextPageCursor,
        if (perPage != null) 'perPage': '$perPage',
        if (prevPageCursor != null) 'prev_page_cursor': prevPageCursor,
        if (sort != null) 'sort': sort,
        if (startDate != null) 'startDate': startDate,
        if (status != null) 'status': status.map((e) => e).join(','),
        if (subscriptionId != null) 'subscriptionId': subscriptionId,
      },
    );
  }

  /// This endpoint enables you retry a previously successful event delivery
  Future<dynamic> forceResendEventDeliveries({
    required String projectId,
    required ModelsIDs body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/eventdeliveries/forceresend',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint fetches an event delivery.
  Future<dynamic> getEventDelivery({
    required String projectId,
    required String eventDeliveryId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/eventdeliveries/{eventDeliveryID}',
      pathParameters: {
        'projectID': projectId,
        'eventDeliveryID': eventDeliveryId,
      },
    );
  }

  /// This endpoint fetches an app message's delivery attempts
  Future<dynamic> getDeliveryAttempts({
    required String projectId,
    required String eventDeliveryId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/eventdeliveries/{eventDeliveryID}/deliveryattempts',
      pathParameters: {
        'projectID': projectId,
        'eventDeliveryID': eventDeliveryId,
      },
    );
  }

  /// This endpoint fetches an app event delivery attempt
  Future<dynamic> getDeliveryAttempt({
    required String projectId,
    required String eventDeliveryId,
    required String deliveryAttemptId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/eventdeliveries/{eventDeliveryID}/deliveryattempts/{deliveryAttemptID}',
      pathParameters: {
        'projectID': projectId,
        'eventDeliveryID': eventDeliveryId,
        'deliveryAttemptID': deliveryAttemptId,
      },
    );
  }

  /// This endpoint retries an event delivery.
  Future<dynamic> resendEventDelivery({
    required String projectId,
    required String eventDeliveryId,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/eventdeliveries/{eventDeliveryID}/resend',
      pathParameters: {
        'projectID': projectId,
        'eventDeliveryID': eventDeliveryId,
      },
    );
  }

  /// This endpoint fetches app events with pagination
  Future<dynamic> getEventsPaged({
    required String projectId,
    String? direction,
    String? endDate,
    List<String>? endpointId,
    String? idempotencyKey,
    String? nextPageCursor,
    int? perPage,
    String? prevPageCursor,
    String? query,
    String? sort,
    List<String>? sourceId,
    String? startDate,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/events',
      pathParameters: {'projectID': projectId},
      queryParameters: {
        if (direction != null) 'direction': direction,
        if (endDate != null) 'endDate': endDate,
        if (endpointId != null)
          'endpointId': endpointId.map((e) => e).join(','),
        if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
        if (nextPageCursor != null) 'next_page_cursor': nextPageCursor,
        if (perPage != null) 'perPage': '$perPage',
        if (prevPageCursor != null) 'prev_page_cursor': prevPageCursor,
        if (query != null) 'query': query,
        if (sort != null) 'sort': sort,
        if (sourceId != null) 'sourceId': sourceId.map((e) => e).join(','),
        if (startDate != null) 'startDate': startDate,
      },
    );
  }

  /// This endpoint creates an endpoint event
  Future<dynamic> createEndpointEvent({
    required String projectId,
    required ModelsCreateEvent body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/events',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint replays multiple events at once.
  Future<dynamic> batchReplayEvents({
    required String projectId,
    String? direction,
    String? endDate,
    List<String>? endpointId,
    String? idempotencyKey,
    String? nextPageCursor,
    int? perPage,
    String? prevPageCursor,
    String? query,
    String? sort,
    List<String>? sourceId,
    String? startDate,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/events/batchreplay',
      pathParameters: {'projectID': projectId},
      queryParameters: {
        if (direction != null) 'direction': direction,
        if (endDate != null) 'endDate': endDate,
        if (endpointId != null)
          'endpointId': endpointId.map((e) => e).join(','),
        if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
        if (nextPageCursor != null) 'next_page_cursor': nextPageCursor,
        if (perPage != null) 'perPage': '$perPage',
        if (prevPageCursor != null) 'prev_page_cursor': prevPageCursor,
        if (query != null) 'query': query,
        if (sort != null) 'sort': sort,
        if (sourceId != null) 'sourceId': sourceId.map((e) => e).join(','),
        if (startDate != null) 'startDate': startDate,
      },
    );
  }

  /// This endpoint creates a event that is broadcast to every endpoint whose
  /// subscription matches the given event type.
  Future<dynamic> createBroadcastEvent({
    required String projectId,
    required ModelsBroadcastEvent body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/events/broadcast',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint does not require creating endpoint and subscriptions ahead
  /// of time. Instead, you supply the endpoint and the payload, and Convoy
  /// delivers the events
  Future<HandlersStub> createDynamicEvent({
    required String projectId,
    required ModelsDynamicEvent body,
  }) async {
    return HandlersStub.fromJson(
      await _client.send(
        'post',
        'v1/projects/{projectID}/events/dynamic',
        pathParameters: {'projectID': projectId},
        body: body.toJson(),
      ),
    );
  }

  /// This endpoint uses the owner_id to fan out an event to multiple endpoints.
  Future<dynamic> createEndpointFanoutEvent({
    required String projectId,
    required ModelsFanoutEvent body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/events/fanout',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint retrieves an event
  Future<dynamic> getEndpointEvent({
    required String projectId,
    required String eventId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/events/{eventID}',
      pathParameters: {'projectID': projectId, 'eventID': eventId},
    );
  }

  /// This endpoint replays an event afresh assuming it is a new event.
  Future<dynamic> replayEndpointEvent({
    required String projectId,
    required String eventId,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/events/{eventID}/replay',
      pathParameters: {'projectID': projectId, 'eventID': eventId},
    );
  }

  /// This endpoint fetches meta events with pagination
  Future<dynamic> getMetaEventsPaged({
    required String projectId,
    String? direction,
    String? endDate,
    String? nextPageCursor,
    int? perPage,
    String? prevPageCursor,
    String? sort,
    String? startDate,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/meta-events',
      pathParameters: {'projectID': projectId},
      queryParameters: {
        if (direction != null) 'direction': direction,
        if (endDate != null) 'endDate': endDate,
        if (nextPageCursor != null) 'next_page_cursor': nextPageCursor,
        if (perPage != null) 'perPage': '$perPage',
        if (prevPageCursor != null) 'prev_page_cursor': prevPageCursor,
        if (sort != null) 'sort': sort,
        if (startDate != null) 'startDate': startDate,
      },
    );
  }

  /// This endpoint retrieves a meta event
  Future<dynamic> getMetaEvent({
    required String projectId,
    required String metaEventId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/meta-events/{metaEventID}',
      pathParameters: {'projectID': projectId, 'metaEventID': metaEventId},
    );
  }

  /// This endpoint retries a meta event
  Future<dynamic> resendMetaEvent({
    required String projectId,
    required String metaEventId,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/meta-events/{metaEventID}/resend',
      pathParameters: {'projectID': projectId, 'metaEventID': metaEventId},
    );
  }

  /// This endpoint fetches multiple portal links
  Future<dynamic> loadPortalLinksPaged({
    required String projectId,
    String? direction,
    String? nextPageCursor,
    String? ownerId,
    int? perPage,
    String? prevPageCursor,
    String? q,
    String? sort,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/portal-links',
      pathParameters: {'projectID': projectId},
      queryParameters: {
        if (direction != null) 'direction': direction,
        if (nextPageCursor != null) 'next_page_cursor': nextPageCursor,
        if (ownerId != null) 'ownerId': ownerId,
        if (perPage != null) 'perPage': '$perPage',
        if (prevPageCursor != null) 'prev_page_cursor': prevPageCursor,
        if (q != null) 'q': q,
        if (sort != null) 'sort': sort,
      },
    );
  }

  /// This endpoint creates a portal link
  Future<dynamic> createPortalLink({
    required String projectId,
    required DatastoreCreatePortalLinkRequest body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/portal-links',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint retrieves a portal link by its id.
  Future<dynamic> getPortalLink({
    required String projectId,
    required String portalLinkId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/portal-links/{portalLinkID}',
      pathParameters: {'projectID': projectId, 'portalLinkID': portalLinkId},
    );
  }

  /// This endpoint updates a portal link
  Future<dynamic> updatePortalLink({
    required String projectId,
    required String portalLinkId,
    required DatastoreUpdatePortalLinkRequest body,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/portal-links/{portalLinkID}',
      pathParameters: {'projectID': projectId, 'portalLinkID': portalLinkId},
      body: body.toJson(),
    );
  }

  /// This endpoint retrieves a portal link auth token
  Future<dynamic> refreshPortalLinkAuthToken({
    required String projectId,
    required String portalLinkId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/portal-links/{portalLinkID}/refresh_token',
      pathParameters: {'projectID': projectId, 'portalLinkID': portalLinkId},
    );
  }

  /// This endpoint revokes a portal link
  Future<dynamic> revokePortalLink({
    required String projectId,
    required String portalLinkId,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/portal-links/{portalLinkID}/revoke',
      pathParameters: {'projectID': projectId, 'portalLinkID': portalLinkId},
    );
  }

  /// This endpoint fetches multiple sources
  Future<dynamic> loadSourcesPaged({
    required String projectId,
    String? direction,
    String? nextPageCursor,
    int? perPage,
    String? prevPageCursor,
    String? provider,
    String? sort,
    String? type,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/sources',
      pathParameters: {'projectID': projectId},
      queryParameters: {
        if (direction != null) 'direction': direction,
        if (nextPageCursor != null) 'next_page_cursor': nextPageCursor,
        if (perPage != null) 'perPage': '$perPage',
        if (prevPageCursor != null) 'prev_page_cursor': prevPageCursor,
        if (provider != null) 'provider': provider,
        if (sort != null) 'sort': sort,
        if (type != null) 'type': type,
      },
    );
  }

  /// This endpoint creates a source
  Future<dynamic> createSource({
    required String projectId,
    required ModelsCreateSource body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/sources',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint validates that a filter will match a certain payload
  /// structure.
  Future<dynamic> validateSourceFunction({
    required String projectId,
    required ModelsFunctionRequest body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/sources/test_function',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint deletes a source
  Future<dynamic> deleteSource({
    required String projectId,
    required String sourceId,
  }) async {
    return await _client.send(
      'delete',
      'v1/projects/{projectID}/sources/{sourceID}',
      pathParameters: {'projectID': projectId, 'sourceID': sourceId},
    );
  }

  /// This endpoint retrieves a source by its id
  Future<dynamic> getSource({
    required String projectId,
    required String sourceId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/sources/{sourceID}',
      pathParameters: {'projectID': projectId, 'sourceID': sourceId},
    );
  }

  /// This endpoint updates a source
  Future<dynamic> updateSource({
    required String projectId,
    required String sourceId,
    required ModelsUpdateSource body,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/sources/{sourceID}',
      pathParameters: {'projectID': projectId, 'sourceID': sourceId},
      body: body.toJson(),
    );
  }

  /// This endpoint fetches all the subscriptions
  Future<dynamic> getSubscriptions({
    required String projectId,
    String? direction,
    List<String>? endpointId,
    String? name,
    String? nextPageCursor,
    int? perPage,
    String? prevPageCursor,
    String? sort,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/subscriptions',
      pathParameters: {'projectID': projectId},
      queryParameters: {
        if (direction != null) 'direction': direction,
        if (endpointId != null)
          'endpointId': endpointId.map((e) => e).join(','),
        if (name != null) 'name': name,
        if (nextPageCursor != null) 'next_page_cursor': nextPageCursor,
        if (perPage != null) 'perPage': '$perPage',
        if (prevPageCursor != null) 'prev_page_cursor': prevPageCursor,
        if (sort != null) 'sort': sort,
      },
    );
  }

  /// This endpoint creates a subscriptions
  Future<dynamic> createSubscription({
    required String projectId,
    required ModelsCreateSubscription body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/subscriptions',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint validates that a filter will match a certain payload
  /// structure.
  Future<dynamic> testSubscriptionFilter({
    required String projectId,
    required ModelsTestFilter body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/subscriptions/test_filter',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint test runs a transform function against a payload.
  Future<dynamic> testSubscriptionFunction({
    required String projectId,
    required ModelsFunctionRequest body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/subscriptions/test_function',
      pathParameters: {'projectID': projectId},
      body: body.toJson(),
    );
  }

  /// This endpoint deletes a subscription
  Future<dynamic> deleteSubscription({
    required String projectId,
    required String subscriptionId,
  }) async {
    return await _client.send(
      'delete',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
      },
    );
  }

  /// This endpoint retrieves a single subscription
  Future<dynamic> getSubscription({
    required String projectId,
    required String subscriptionId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
      },
    );
  }

  /// This endpoint updates a subscription
  Future<dynamic> updateSubscription({
    required String projectId,
    required String subscriptionId,
    required ModelsUpdateSubscription body,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
      },
      body: body.toJson(),
    );
  }

  /// This endpoint fetches all filters for a subscription
  Future<dynamic> getFilters({
    required String projectId,
    required String subscriptionId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}/filters',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
      },
    );
  }

  /// This endpoint creates a new filter for a subscription
  Future<dynamic> createFilter({
    required String projectId,
    required String subscriptionId,
    required ModelsCreateFilterRequest body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}/filters',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
      },
      body: body.toJson(),
    );
  }

  /// This endpoint creates multiple filters for a subscription
  Future<dynamic> bulkCreateFilters({
    required String projectId,
    required String subscriptionId,
    required List<ModelsCreateFilterRequest> body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}/filters/bulk',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
      },
      body: body.map((i) => i.toJson()).toList(),
    );
  }

  /// This endpoint updates multiple filters for a subscription
  Future<dynamic> bulkUpdateFilters({
    required String projectId,
    required String subscriptionId,
    required List<ModelsBulkUpdateFilterRequest> body,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}/filters/bulk_update',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
      },
      body: body.map((i) => i.toJson()).toList(),
    );
  }

  /// This endpoint tests a filter against a payload
  Future<dynamic> testFilter({
    required String projectId,
    required String subscriptionId,
    required String eventType,
    required ModelsTestFilterRequest body,
  }) async {
    return await _client.send(
      'post',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}/filters/test/{eventType}',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
        'eventType': eventType,
      },
      body: body.toJson(),
    );
  }

  /// This endpoint deletes a filter
  Future<dynamic> deleteFilter({
    required String projectId,
    required String subscriptionId,
    required String filterId,
  }) async {
    return await _client.send(
      'delete',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}/filters/{filterID}',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
        'filterID': filterId,
      },
    );
  }

  /// This endpoint retrieves a single filter
  Future<dynamic> getFilter({
    required String projectId,
    required String subscriptionId,
    required String filterId,
  }) async {
    return await _client.send(
      'get',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}/filters/{filterID}',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
        'filterID': filterId,
      },
    );
  }

  /// This endpoint updates an existing filter
  Future<dynamic> updateFilter({
    required String projectId,
    required String subscriptionId,
    required String filterId,
    required ModelsUpdateFilterRequest body,
  }) async {
    return await _client.send(
      'put',
      'v1/projects/{projectID}/subscriptions/{subscriptionID}/filters/{filterID}',
      pathParameters: {
        'projectID': projectId,
        'subscriptionID': subscriptionId,
        'filterID': filterId,
      },
      body: body.toJson(),
    );
  }
}

class DatastoreDeliveryMode {
  static const atLeastOnce = DatastoreDeliveryMode._('at_least_once');
  static const atMostOnce = DatastoreDeliveryMode._('at_most_once');

  static const values = [atLeastOnce, atMostOnce];
  final String value;

  const DatastoreDeliveryMode._(this.value);

  static DatastoreDeliveryMode fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreDeliveryMode._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreDeviceStatus {
  static const offline = DatastoreDeviceStatus._('offline');
  static const online = DatastoreDeviceStatus._('online');
  static const disabled = DatastoreDeviceStatus._('disabled');

  static const values = [offline, online, disabled];
  final String value;

  const DatastoreDeviceStatus._(this.value);

  static DatastoreDeviceStatus fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreDeviceStatus._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreEncodingType {
  static const base64 = DatastoreEncodingType._('base64');
  static const hex = DatastoreEncodingType._('hex');

  static const values = [base64, hex];
  final String value;

  const DatastoreEncodingType._(this.value);

  static DatastoreEncodingType fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreEncodingType._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreEndpointAuthenticationType {
  static const apiKey = DatastoreEndpointAuthenticationType._('api_key');
  static const oauth2 = DatastoreEndpointAuthenticationType._('oauth2');
  static const basicAuth = DatastoreEndpointAuthenticationType._('basic_auth');

  static const values = [apiKey, oauth2, basicAuth];
  final String value;

  const DatastoreEndpointAuthenticationType._(this.value);

  static DatastoreEndpointAuthenticationType fromValue(String value) =>
      values.firstWhere(
        (e) => e.value == value,
        orElse: () => DatastoreEndpointAuthenticationType._(value),
      );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreEndpointStatus {
  static const active = DatastoreEndpointStatus._('active');
  static const inactive = DatastoreEndpointStatus._('inactive');
  static const paused = DatastoreEndpointStatus._('paused');

  static const values = [active, inactive, paused];
  final String value;

  const DatastoreEndpointStatus._(this.value);

  static DatastoreEndpointStatus fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreEndpointStatus._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreEventDeliveryStatus {
  static const scheduled = DatastoreEventDeliveryStatus._('Scheduled');
  static const processing = DatastoreEventDeliveryStatus._('Processing');
  static const discarded = DatastoreEventDeliveryStatus._('Discarded');
  static const failure = DatastoreEventDeliveryStatus._('Failure');
  static const success = DatastoreEventDeliveryStatus._('Success');
  static const retry = DatastoreEventDeliveryStatus._('Retry');

  static const values = [
    scheduled,
    processing,
    discarded,
    failure,
    success,
    retry,
  ];
  final String value;

  const DatastoreEventDeliveryStatus._(this.value);

  static DatastoreEventDeliveryStatus fromValue(String value) =>
      values.firstWhere(
        (e) => e.value == value,
        orElse: () => DatastoreEventDeliveryStatus._(value),
      );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreEventStatus {
  static const processing = DatastoreEventStatus._('Processing');
  static const failure = DatastoreEventStatus._('Failure');
  static const success = DatastoreEventStatus._('Success');
  static const retry = DatastoreEventStatus._('Retry');
  static const pending = DatastoreEventStatus._('Pending');

  static const values = [processing, failure, success, retry, pending];
  final String value;

  const DatastoreEventStatus._(this.value);

  static DatastoreEventStatus fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreEventStatus._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreOAuth2AuthenticationType {
  static const sharedSecret = DatastoreOAuth2AuthenticationType._(
    'shared_secret',
  );
  static const clientAssertion = DatastoreOAuth2AuthenticationType._(
    'client_assertion',
  );

  static const values = [sharedSecret, clientAssertion];
  final String value;

  const DatastoreOAuth2AuthenticationType._(this.value);

  static DatastoreOAuth2AuthenticationType fromValue(String value) =>
      values.firstWhere(
        (e) => e.value == value,
        orElse: () => DatastoreOAuth2AuthenticationType._(value),
      );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreOAuth2ExpiryTimeUnit {
  static const seconds = DatastoreOAuth2ExpiryTimeUnit._('seconds');
  static const milliseconds = DatastoreOAuth2ExpiryTimeUnit._('milliseconds');
  static const minutes = DatastoreOAuth2ExpiryTimeUnit._('minutes');
  static const hours = DatastoreOAuth2ExpiryTimeUnit._('hours');

  static const values = [seconds, milliseconds, minutes, hours];
  final String value;

  const DatastoreOAuth2ExpiryTimeUnit._(this.value);

  static DatastoreOAuth2ExpiryTimeUnit fromValue(String value) =>
      values.firstWhere(
        (e) => e.value == value,
        orElse: () => DatastoreOAuth2ExpiryTimeUnit._(value),
      );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastorePageDirection {
  static const next = DatastorePageDirection._('next');
  static const prev = DatastorePageDirection._('prev');

  static const values = [next, prev];
  final String value;

  const DatastorePageDirection._(this.value);

  static DatastorePageDirection fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastorePageDirection._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastorePortalAuthType {
  static const refreshToken = DatastorePortalAuthType._('refresh_token');
  static const staticToken = DatastorePortalAuthType._('static_token');

  static const values = [refreshToken, staticToken];
  final String value;

  const DatastorePortalAuthType._(this.value);

  static DatastorePortalAuthType fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastorePortalAuthType._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastorePubSubType {
  static const sqs = DatastorePubSubType._('sqs');
  static const google = DatastorePubSubType._('google');
  static const kafka = DatastorePubSubType._('kafka');
  static const amqp = DatastorePubSubType._('amqp');

  static const values = [sqs, google, kafka, amqp];
  final String value;

  const DatastorePubSubType._(this.value);

  static DatastorePubSubType fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastorePubSubType._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreSourceProvider {
  static const github = DatastoreSourceProvider._('github');
  static const twitter = DatastoreSourceProvider._('twitter');
  static const shopify = DatastoreSourceProvider._('shopify');

  static const values = [github, twitter, shopify];
  final String value;

  const DatastoreSourceProvider._(this.value);

  static DatastoreSourceProvider fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreSourceProvider._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreSourceType {
  static const http = DatastoreSourceType._('http');
  static const restApi = DatastoreSourceType._('rest_api');
  static const pubSub = DatastoreSourceType._('pub_sub');
  static const dbChangeStream = DatastoreSourceType._('db_change_stream');

  static const values = [http, restApi, pubSub, dbChangeStream];
  final String value;

  const DatastoreSourceType._(this.value);

  static DatastoreSourceType fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreSourceType._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreStrategyProvider {
  static const linear = DatastoreStrategyProvider._('linear');
  static const exponential = DatastoreStrategyProvider._('exponential');

  static const values = [linear, exponential];
  final String value;

  const DatastoreStrategyProvider._(this.value);

  static DatastoreStrategyProvider fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreStrategyProvider._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreSubscriptionType {
  static const cli = DatastoreSubscriptionType._('cli');
  static const api = DatastoreSubscriptionType._('api');

  static const values = [cli, api];
  final String value;

  const DatastoreSubscriptionType._(this.value);

  static DatastoreSubscriptionType fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreSubscriptionType._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreVerifierType {
  static const noop = DatastoreVerifierType._('noop');
  static const hmac = DatastoreVerifierType._('hmac');
  static const basicAuth = DatastoreVerifierType._('basic_auth');
  static const apiKey = DatastoreVerifierType._('api_key');

  static const values = [noop, hmac, basicAuth, apiKey];
  final String value;

  const DatastoreVerifierType._(this.value);

  static DatastoreVerifierType fromValue(String value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => DatastoreVerifierType._(value),
  );

  /// An enum received from the server but this version of the client doesn't recognize it.
  bool get isUnknown => values.every((v) => v.value != value);

  @override
  String toString() => value;
}

class DatastoreAlertConfiguration {
  final int? count;
  final String? threshold;

  DatastoreAlertConfiguration({this.count, this.threshold});

  factory DatastoreAlertConfiguration.fromJson(Map<String, Object?> json) {
    return DatastoreAlertConfiguration(
      count: (json[r'count'] as num?)?.toInt(),
      threshold: json[r'threshold'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var count = this.count;
    var threshold = this.threshold;

    final json = <String, Object?>{};
    if (count != null) {
      json[r'count'] = count;
    }
    if (threshold != null) {
      json[r'threshold'] = threshold;
    }
    return json;
  }

  DatastoreAlertConfiguration copyWith({int? count, String? threshold}) {
    return DatastoreAlertConfiguration(
      count: count ?? this.count,
      threshold: threshold ?? this.threshold,
    );
  }
}

class DatastoreAmqpCredentials {
  final String? password;
  final String? user;

  DatastoreAmqpCredentials({this.password, this.user});

  factory DatastoreAmqpCredentials.fromJson(Map<String, Object?> json) {
    return DatastoreAmqpCredentials(
      password: json[r'password'] as String?,
      user: json[r'user'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var password = this.password;
    var user = this.user;

    final json = <String, Object?>{};
    if (password != null) {
      json[r'password'] = password;
    }
    if (user != null) {
      json[r'user'] = user;
    }
    return json;
  }

  DatastoreAmqpCredentials copyWith({String? password, String? user}) {
    return DatastoreAmqpCredentials(
      password: password ?? this.password,
      user: user ?? this.user,
    );
  }
}

class DatastoreAmqpPubSubConfig {
  final DatastoreAmqpCredentials? auth;
  final String? bindedExchange;
  final String? deadLetterExchange;
  final String? host;
  final String? port;
  final String? queue;
  final String? routingKey;
  final String? schema;
  final String? vhost;

  DatastoreAmqpPubSubConfig({
    this.auth,
    this.bindedExchange,
    this.deadLetterExchange,
    this.host,
    this.port,
    this.queue,
    this.routingKey,
    this.schema,
    this.vhost,
  });

  factory DatastoreAmqpPubSubConfig.fromJson(Map<String, Object?> json) {
    return DatastoreAmqpPubSubConfig(
      auth: json[r'auth'] != null
          ? DatastoreAmqpCredentials.fromJson(
              json[r'auth']! as Map<String, Object?>,
            )
          : null,
      bindedExchange: json[r'bindedExchange'] as String?,
      deadLetterExchange: json[r'deadLetterExchange'] as String?,
      host: json[r'host'] as String?,
      port: json[r'port'] as String?,
      queue: json[r'queue'] as String?,
      routingKey: json[r'routingKey'] as String?,
      schema: json[r'schema'] as String?,
      vhost: json[r'vhost'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var auth = this.auth;
    var bindedExchange = this.bindedExchange;
    var deadLetterExchange = this.deadLetterExchange;
    var host = this.host;
    var port = this.port;
    var queue = this.queue;
    var routingKey = this.routingKey;
    var schema = this.schema;
    var vhost = this.vhost;

    final json = <String, Object?>{};
    if (auth != null) {
      json[r'auth'] = auth.toJson();
    }
    if (bindedExchange != null) {
      json[r'bindedExchange'] = bindedExchange;
    }
    if (deadLetterExchange != null) {
      json[r'deadLetterExchange'] = deadLetterExchange;
    }
    if (host != null) {
      json[r'host'] = host;
    }
    if (port != null) {
      json[r'port'] = port;
    }
    if (queue != null) {
      json[r'queue'] = queue;
    }
    if (routingKey != null) {
      json[r'routingKey'] = routingKey;
    }
    if (schema != null) {
      json[r'schema'] = schema;
    }
    if (vhost != null) {
      json[r'vhost'] = vhost;
    }
    return json;
  }

  DatastoreAmqpPubSubConfig copyWith({
    DatastoreAmqpCredentials? auth,
    String? bindedExchange,
    String? deadLetterExchange,
    String? host,
    String? port,
    String? queue,
    String? routingKey,
    String? schema,
    String? vhost,
  }) {
    return DatastoreAmqpPubSubConfig(
      auth: auth ?? this.auth,
      bindedExchange: bindedExchange ?? this.bindedExchange,
      deadLetterExchange: deadLetterExchange ?? this.deadLetterExchange,
      host: host ?? this.host,
      port: port ?? this.port,
      queue: queue ?? this.queue,
      routingKey: routingKey ?? this.routingKey,
      schema: schema ?? this.schema,
      vhost: vhost ?? this.vhost,
    );
  }
}

class DatastoreApiKey {
  final String? headerName;
  final String? headerValue;

  DatastoreApiKey({this.headerName, this.headerValue});

  factory DatastoreApiKey.fromJson(Map<String, Object?> json) {
    return DatastoreApiKey(
      headerName: json[r'header_name'] as String?,
      headerValue: json[r'header_value'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var headerName = this.headerName;
    var headerValue = this.headerValue;

    final json = <String, Object?>{};
    if (headerName != null) {
      json[r'header_name'] = headerName;
    }
    if (headerValue != null) {
      json[r'header_value'] = headerValue;
    }
    return json;
  }

  DatastoreApiKey copyWith({String? headerName, String? headerValue}) {
    return DatastoreApiKey(
      headerName: headerName ?? this.headerName,
      headerValue: headerValue ?? this.headerValue,
    );
  }
}

class DatastoreBasicAuth {
  final String? password;
  final String? username;

  DatastoreBasicAuth({this.password, this.username});

  factory DatastoreBasicAuth.fromJson(Map<String, Object?> json) {
    return DatastoreBasicAuth(
      password: json[r'password'] as String?,
      username: json[r'username'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var password = this.password;
    var username = this.username;

    final json = <String, Object?>{};
    if (password != null) {
      json[r'password'] = password;
    }
    if (username != null) {
      json[r'username'] = username;
    }
    return json;
  }

  DatastoreBasicAuth copyWith({String? password, String? username}) {
    return DatastoreBasicAuth(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }
}

class DatastoreCLIMetadata {
  final String? eventType;
  final String? sourceId;

  DatastoreCLIMetadata({this.eventType, this.sourceId});

  factory DatastoreCLIMetadata.fromJson(Map<String, Object?> json) {
    return DatastoreCLIMetadata(
      eventType: json[r'event_type'] as String?,
      sourceId: json[r'source_id'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var eventType = this.eventType;
    var sourceId = this.sourceId;

    final json = <String, Object?>{};
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (sourceId != null) {
      json[r'source_id'] = sourceId;
    }
    return json;
  }

  DatastoreCLIMetadata copyWith({String? eventType, String? sourceId}) {
    return DatastoreCLIMetadata(
      eventType: eventType ?? this.eventType,
      sourceId: sourceId ?? this.sourceId,
    );
  }
}

class DatastoreCreatePortalLinkRequest {
  final String? authType;

  /// Specify whether endpoint management can be done through the Portal Link UI
  final bool? canManageEndpoint;

  /// Deprecated
  /// IDs of endpoints in this portal link
  final List<String>? endpoints;

  /// Portal Link Name
  final String? name;

  /// OwnerID, the portal link will inherit all the endpoints with this owner ID
  final String? ownerId;

  DatastoreCreatePortalLinkRequest({
    this.authType,
    this.canManageEndpoint,
    this.endpoints,
    this.name,
    this.ownerId,
  });

  factory DatastoreCreatePortalLinkRequest.fromJson(Map<String, Object?> json) {
    return DatastoreCreatePortalLinkRequest(
      authType: json[r'auth_type'] as String?,
      canManageEndpoint: json[r'can_manage_endpoint'] as bool?,
      endpoints: (json[r'endpoints'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      name: json[r'name'] as String?,
      ownerId: json[r'owner_id'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var authType = this.authType;
    var canManageEndpoint = this.canManageEndpoint;
    var endpoints = this.endpoints;
    var name = this.name;
    var ownerId = this.ownerId;

    final json = <String, Object?>{};
    if (authType != null) {
      json[r'auth_type'] = authType;
    }
    if (canManageEndpoint != null) {
      json[r'can_manage_endpoint'] = canManageEndpoint;
    }
    if (endpoints != null) {
      json[r'endpoints'] = endpoints;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (ownerId != null) {
      json[r'owner_id'] = ownerId;
    }
    return json;
  }

  DatastoreCreatePortalLinkRequest copyWith({
    String? authType,
    bool? canManageEndpoint,
    List<String>? endpoints,
    String? name,
    String? ownerId,
  }) {
    return DatastoreCreatePortalLinkRequest(
      authType: authType ?? this.authType,
      canManageEndpoint: canManageEndpoint ?? this.canManageEndpoint,
      endpoints: endpoints ?? this.endpoints,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
    );
  }
}

class DatastoreCustomResponse {
  final String? body;
  final String? contentType;

  DatastoreCustomResponse({this.body, this.contentType});

  factory DatastoreCustomResponse.fromJson(Map<String, Object?> json) {
    return DatastoreCustomResponse(
      body: json[r'body'] as String?,
      contentType: json[r'content_type'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var contentType = this.contentType;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body;
    }
    if (contentType != null) {
      json[r'content_type'] = contentType;
    }
    return json;
  }

  DatastoreCustomResponse copyWith({String? body, String? contentType}) {
    return DatastoreCustomResponse(
      body: body ?? this.body,
      contentType: contentType ?? this.contentType,
    );
  }
}

class DatastoreDeliveryAttempt {
  final String? apiVersion;
  final String? createdAt;
  final String? deletedAt;
  final String? endpointId;
  final String? error;
  final String? httpStatus;
  final String? ipAddress;
  final String? method;
  final String? msgId;
  final String? projectId;
  final DatastoreHttpHeader? requestHttpHeader;
  final String? responseData;
  final DatastoreHttpHeader? responseHttpHeader;
  final bool? status;
  final String? uid;
  final String? updatedAt;
  final String? url;

  DatastoreDeliveryAttempt({
    this.apiVersion,
    this.createdAt,
    this.deletedAt,
    this.endpointId,
    this.error,
    this.httpStatus,
    this.ipAddress,
    this.method,
    this.msgId,
    this.projectId,
    this.requestHttpHeader,
    this.responseData,
    this.responseHttpHeader,
    this.status,
    this.uid,
    this.updatedAt,
    this.url,
  });

  factory DatastoreDeliveryAttempt.fromJson(Map<String, Object?> json) {
    return DatastoreDeliveryAttempt(
      apiVersion: json[r'api_version'] as String?,
      createdAt: json[r'created_at'] as String?,
      deletedAt: json[r'deleted_at'] as String?,
      endpointId: json[r'endpoint_id'] as String?,
      error: json[r'error'] as String?,
      httpStatus: json[r'http_status'] as String?,
      ipAddress: json[r'ip_address'] as String?,
      method: json[r'method'] as String?,
      msgId: json[r'msg_id'] as String?,
      projectId: json[r'project_id'] as String?,
      requestHttpHeader: json[r'request_http_header'] != null
          ? DatastoreHttpHeader.fromJson(
              json[r'request_http_header']! as Map<String, Object?>,
            )
          : null,
      responseData: json[r'response_data'] as String?,
      responseHttpHeader: json[r'response_http_header'] != null
          ? DatastoreHttpHeader.fromJson(
              json[r'response_http_header']! as Map<String, Object?>,
            )
          : null,
      status: json[r'status'] as bool?,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      url: json[r'url'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var apiVersion = this.apiVersion;
    var createdAt = this.createdAt;
    var deletedAt = this.deletedAt;
    var endpointId = this.endpointId;
    var error = this.error;
    var httpStatus = this.httpStatus;
    var ipAddress = this.ipAddress;
    var method = this.method;
    var msgId = this.msgId;
    var projectId = this.projectId;
    var requestHttpHeader = this.requestHttpHeader;
    var responseData = this.responseData;
    var responseHttpHeader = this.responseHttpHeader;
    var status = this.status;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var url = this.url;

    final json = <String, Object?>{};
    if (apiVersion != null) {
      json[r'api_version'] = apiVersion;
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (endpointId != null) {
      json[r'endpoint_id'] = endpointId;
    }
    if (error != null) {
      json[r'error'] = error;
    }
    if (httpStatus != null) {
      json[r'http_status'] = httpStatus;
    }
    if (ipAddress != null) {
      json[r'ip_address'] = ipAddress;
    }
    if (method != null) {
      json[r'method'] = method;
    }
    if (msgId != null) {
      json[r'msg_id'] = msgId;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (requestHttpHeader != null) {
      json[r'request_http_header'] = requestHttpHeader.toJson();
    }
    if (responseData != null) {
      json[r'response_data'] = responseData;
    }
    if (responseHttpHeader != null) {
      json[r'response_http_header'] = responseHttpHeader.toJson();
    }
    if (status != null) {
      json[r'status'] = status;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    return json;
  }

  DatastoreDeliveryAttempt copyWith({
    String? apiVersion,
    String? createdAt,
    String? deletedAt,
    String? endpointId,
    String? error,
    String? httpStatus,
    String? ipAddress,
    String? method,
    String? msgId,
    String? projectId,
    DatastoreHttpHeader? requestHttpHeader,
    String? responseData,
    DatastoreHttpHeader? responseHttpHeader,
    bool? status,
    String? uid,
    String? updatedAt,
    String? url,
  }) {
    return DatastoreDeliveryAttempt(
      apiVersion: apiVersion ?? this.apiVersion,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      endpointId: endpointId ?? this.endpointId,
      error: error ?? this.error,
      httpStatus: httpStatus ?? this.httpStatus,
      ipAddress: ipAddress ?? this.ipAddress,
      method: method ?? this.method,
      msgId: msgId ?? this.msgId,
      projectId: projectId ?? this.projectId,
      requestHttpHeader: requestHttpHeader ?? this.requestHttpHeader,
      responseData: responseData ?? this.responseData,
      responseHttpHeader: responseHttpHeader ?? this.responseHttpHeader,
      status: status ?? this.status,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
    );
  }
}

class DatastoreDevice {
  final String? createdAt;
  final String? deletedAt;
  final String? endpointId;
  final String? hostName;
  final String? lastSeenAt;
  final String? projectId;
  final DatastoreDeviceStatus? status;
  final String? uid;
  final String? updatedAt;

  DatastoreDevice({
    this.createdAt,
    this.deletedAt,
    this.endpointId,
    this.hostName,
    this.lastSeenAt,
    this.projectId,
    this.status,
    this.uid,
    this.updatedAt,
  });

  factory DatastoreDevice.fromJson(Map<String, Object?> json) {
    return DatastoreDevice(
      createdAt: json[r'created_at'] as String?,
      deletedAt: json[r'deleted_at'] as String?,
      endpointId: json[r'endpoint_id'] as String?,
      hostName: json[r'host_name'] as String?,
      lastSeenAt: json[r'last_seen_at'] as String?,
      projectId: json[r'project_id'] as String?,
      status: json[r'status'] != null
          ? DatastoreDeviceStatus.fromValue(json[r'status']! as String)
          : null,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var createdAt = this.createdAt;
    var deletedAt = this.deletedAt;
    var endpointId = this.endpointId;
    var hostName = this.hostName;
    var lastSeenAt = this.lastSeenAt;
    var projectId = this.projectId;
    var status = this.status;
    var uid = this.uid;
    var updatedAt = this.updatedAt;

    final json = <String, Object?>{};
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (endpointId != null) {
      json[r'endpoint_id'] = endpointId;
    }
    if (hostName != null) {
      json[r'host_name'] = hostName;
    }
    if (lastSeenAt != null) {
      json[r'last_seen_at'] = lastSeenAt;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (status != null) {
      json[r'status'] = status.value;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    return json;
  }

  DatastoreDevice copyWith({
    String? createdAt,
    String? deletedAt,
    String? endpointId,
    String? hostName,
    String? lastSeenAt,
    String? projectId,
    DatastoreDeviceStatus? status,
    String? uid,
    String? updatedAt,
  }) {
    return DatastoreDevice(
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      endpointId: endpointId ?? this.endpointId,
      hostName: hostName ?? this.hostName,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      projectId: projectId ?? this.projectId,
      status: status ?? this.status,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class DatastoreEndpoint {
  final bool? advancedSignatures;
  final DatastoreEndpointAuthentication? authentication;
  final String? contentType;
  final String? createdAt;
  final String? deletedAt;
  final String? description;
  final int? events;
  final num? failureRate;
  final int? httpTimeout;

  /// mTLS client certificate configuration
  final DatastoreMtlsClientCert? mtlsClientCert;
  final String? name;
  final String? ownerId;
  final String? projectId;
  final int? rateLimit;
  final int? rateLimitDuration;
  final List<DatastoreSecret>? secrets;
  final String? slackWebhookUrl;
  final DatastoreEndpointStatus? status;
  final String? supportEmail;
  final String? uid;
  final String? updatedAt;
  final String? url;

  DatastoreEndpoint({
    this.advancedSignatures,
    this.authentication,
    this.contentType,
    this.createdAt,
    this.deletedAt,
    this.description,
    this.events,
    this.failureRate,
    this.httpTimeout,
    this.mtlsClientCert,
    this.name,
    this.ownerId,
    this.projectId,
    this.rateLimit,
    this.rateLimitDuration,
    this.secrets,
    this.slackWebhookUrl,
    this.status,
    this.supportEmail,
    this.uid,
    this.updatedAt,
    this.url,
  });

  factory DatastoreEndpoint.fromJson(Map<String, Object?> json) {
    return DatastoreEndpoint(
      advancedSignatures: json[r'advanced_signatures'] as bool?,
      authentication: json[r'authentication'] != null
          ? DatastoreEndpointAuthentication.fromJson(
              json[r'authentication']! as Map<String, Object?>,
            )
          : null,
      contentType: json[r'content_type'] as String?,
      createdAt: json[r'created_at'] as String?,
      deletedAt: json[r'deleted_at'] as String?,
      description: json[r'description'] as String?,
      events: (json[r'events'] as num?)?.toInt(),
      failureRate: json[r'failure_rate'] as num?,
      httpTimeout: (json[r'http_timeout'] as num?)?.toInt(),
      mtlsClientCert: json[r'mtls_client_cert'] != null
          ? DatastoreMtlsClientCert.fromJson(
              json[r'mtls_client_cert']! as Map<String, Object?>,
            )
          : null,
      name: json[r'name'] as String?,
      ownerId: json[r'owner_id'] as String?,
      projectId: json[r'project_id'] as String?,
      rateLimit: (json[r'rate_limit'] as num?)?.toInt(),
      rateLimitDuration: (json[r'rate_limit_duration'] as num?)?.toInt(),
      secrets: (json[r'secrets'] as List<Object?>?)
          ?.map(
            (i) => DatastoreSecret.fromJson(
              i as Map<String, Object?>? ?? const {},
            ),
          )
          .toList(),
      slackWebhookUrl: json[r'slack_webhook_url'] as String?,
      status: json[r'status'] != null
          ? DatastoreEndpointStatus.fromValue(json[r'status']! as String)
          : null,
      supportEmail: json[r'support_email'] as String?,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      url: json[r'url'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var advancedSignatures = this.advancedSignatures;
    var authentication = this.authentication;
    var contentType = this.contentType;
    var createdAt = this.createdAt;
    var deletedAt = this.deletedAt;
    var description = this.description;
    var events = this.events;
    var failureRate = this.failureRate;
    var httpTimeout = this.httpTimeout;
    var mtlsClientCert = this.mtlsClientCert;
    var name = this.name;
    var ownerId = this.ownerId;
    var projectId = this.projectId;
    var rateLimit = this.rateLimit;
    var rateLimitDuration = this.rateLimitDuration;
    var secrets = this.secrets;
    var slackWebhookUrl = this.slackWebhookUrl;
    var status = this.status;
    var supportEmail = this.supportEmail;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var url = this.url;

    final json = <String, Object?>{};
    if (advancedSignatures != null) {
      json[r'advanced_signatures'] = advancedSignatures;
    }
    if (authentication != null) {
      json[r'authentication'] = authentication.toJson();
    }
    if (contentType != null) {
      json[r'content_type'] = contentType;
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (events != null) {
      json[r'events'] = events;
    }
    if (failureRate != null) {
      json[r'failure_rate'] = failureRate;
    }
    if (httpTimeout != null) {
      json[r'http_timeout'] = httpTimeout;
    }
    if (mtlsClientCert != null) {
      json[r'mtls_client_cert'] = mtlsClientCert.toJson();
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (ownerId != null) {
      json[r'owner_id'] = ownerId;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (rateLimit != null) {
      json[r'rate_limit'] = rateLimit;
    }
    if (rateLimitDuration != null) {
      json[r'rate_limit_duration'] = rateLimitDuration;
    }
    if (secrets != null) {
      json[r'secrets'] = secrets.map((i) => i.toJson()).toList();
    }
    if (slackWebhookUrl != null) {
      json[r'slack_webhook_url'] = slackWebhookUrl;
    }
    if (status != null) {
      json[r'status'] = status.value;
    }
    if (supportEmail != null) {
      json[r'support_email'] = supportEmail;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    return json;
  }

  DatastoreEndpoint copyWith({
    bool? advancedSignatures,
    DatastoreEndpointAuthentication? authentication,
    String? contentType,
    String? createdAt,
    String? deletedAt,
    String? description,
    int? events,
    num? failureRate,
    int? httpTimeout,
    DatastoreMtlsClientCert? mtlsClientCert,
    String? name,
    String? ownerId,
    String? projectId,
    int? rateLimit,
    int? rateLimitDuration,
    List<DatastoreSecret>? secrets,
    String? slackWebhookUrl,
    DatastoreEndpointStatus? status,
    String? supportEmail,
    String? uid,
    String? updatedAt,
    String? url,
  }) {
    return DatastoreEndpoint(
      advancedSignatures: advancedSignatures ?? this.advancedSignatures,
      authentication: authentication ?? this.authentication,
      contentType: contentType ?? this.contentType,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      description: description ?? this.description,
      events: events ?? this.events,
      failureRate: failureRate ?? this.failureRate,
      httpTimeout: httpTimeout ?? this.httpTimeout,
      mtlsClientCert: mtlsClientCert ?? this.mtlsClientCert,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      projectId: projectId ?? this.projectId,
      rateLimit: rateLimit ?? this.rateLimit,
      rateLimitDuration: rateLimitDuration ?? this.rateLimitDuration,
      secrets: secrets ?? this.secrets,
      slackWebhookUrl: slackWebhookUrl ?? this.slackWebhookUrl,
      status: status ?? this.status,
      supportEmail: supportEmail ?? this.supportEmail,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
    );
  }
}

class DatastoreEndpointAuthentication {
  final DatastoreApiKey? apiKey;
  final DatastoreBasicAuth? basicAuth;
  final DatastoreOAuth2? oauth2;
  final DatastoreEndpointAuthenticationType? type;

  DatastoreEndpointAuthentication({
    this.apiKey,
    this.basicAuth,
    this.oauth2,
    this.type,
  });

  factory DatastoreEndpointAuthentication.fromJson(Map<String, Object?> json) {
    return DatastoreEndpointAuthentication(
      apiKey: json[r'api_key'] != null
          ? DatastoreApiKey.fromJson(json[r'api_key']! as Map<String, Object?>)
          : null,
      basicAuth: json[r'basic_auth'] != null
          ? DatastoreBasicAuth.fromJson(
              json[r'basic_auth']! as Map<String, Object?>,
            )
          : null,
      oauth2: json[r'oauth2'] != null
          ? DatastoreOAuth2.fromJson(json[r'oauth2']! as Map<String, Object?>)
          : null,
      type: json[r'type'] != null
          ? DatastoreEndpointAuthenticationType.fromValue(
              json[r'type']! as String,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var apiKey = this.apiKey;
    var basicAuth = this.basicAuth;
    var oauth2 = this.oauth2;
    var type = this.type;

    final json = <String, Object?>{};
    if (apiKey != null) {
      json[r'api_key'] = apiKey.toJson();
    }
    if (basicAuth != null) {
      json[r'basic_auth'] = basicAuth.toJson();
    }
    if (oauth2 != null) {
      json[r'oauth2'] = oauth2.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    return json;
  }

  DatastoreEndpointAuthentication copyWith({
    DatastoreApiKey? apiKey,
    DatastoreBasicAuth? basicAuth,
    DatastoreOAuth2? oauth2,
    DatastoreEndpointAuthenticationType? type,
  }) {
    return DatastoreEndpointAuthentication(
      apiKey: apiKey ?? this.apiKey,
      basicAuth: basicAuth ?? this.basicAuth,
      oauth2: oauth2 ?? this.oauth2,
      type: type ?? this.type,
    );
  }
}

class DatastoreEvent {
  final String? acknowledgedAt;

  /// Deprecated
  final String? appId;
  final String? createdAt;

  /// Data is an arbitrary JSON value that gets sent as the body of the
  /// webhook to the endpoints
  final List<int>? data;
  final String? deletedAt;
  final List<DatastoreEndpoint>? endpointMetadata;
  final List<String>? endpoints;
  final String? eventType;
  final HttpheaderHTTPHeader? headers;
  final String? idempotencyKey;
  final bool? isDuplicateEvent;
  final String? metadata;
  final String? projectId;
  final String? raw;
  final String? sourceId;
  final DatastoreSource? sourceMetadata;
  final DatastoreEventStatus? status;
  final String? uid;
  final String? updatedAt;
  final String? urlQueryParams;

  DatastoreEvent({
    this.acknowledgedAt,
    this.appId,
    this.createdAt,
    this.data,
    this.deletedAt,
    this.endpointMetadata,
    this.endpoints,
    this.eventType,
    this.headers,
    this.idempotencyKey,
    this.isDuplicateEvent,
    this.metadata,
    this.projectId,
    this.raw,
    this.sourceId,
    this.sourceMetadata,
    this.status,
    this.uid,
    this.updatedAt,
    this.urlQueryParams,
  });

  factory DatastoreEvent.fromJson(Map<String, Object?> json) {
    return DatastoreEvent(
      acknowledgedAt: json[r'acknowledged_at'] as String?,
      appId: json[r'app_id'] as String?,
      createdAt: json[r'created_at'] as String?,
      data: (json[r'data'] as List<Object?>?)
          ?.map((i) => (i as num?)?.toInt() ?? 0)
          .toList(),
      deletedAt: json[r'deleted_at'] as String?,
      endpointMetadata: (json[r'endpoint_metadata'] as List<Object?>?)
          ?.map(
            (i) => DatastoreEndpoint.fromJson(
              i as Map<String, Object?>? ?? const {},
            ),
          )
          .toList(),
      endpoints: (json[r'endpoints'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      eventType: json[r'event_type'] as String?,
      headers: json[r'headers'] != null
          ? HttpheaderHTTPHeader.fromJson(
              json[r'headers']! as Map<String, Object?>,
            )
          : null,
      idempotencyKey: json[r'idempotency_key'] as String?,
      isDuplicateEvent: json[r'is_duplicate_event'] as bool?,
      metadata: json[r'metadata'] as String?,
      projectId: json[r'project_id'] as String?,
      raw: json[r'raw'] as String?,
      sourceId: json[r'source_id'] as String?,
      sourceMetadata: json[r'source_metadata'] != null
          ? DatastoreSource.fromJson(
              json[r'source_metadata']! as Map<String, Object?>,
            )
          : null,
      status: json[r'status'] != null
          ? DatastoreEventStatus.fromValue(json[r'status']! as String)
          : null,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      urlQueryParams: json[r'url_query_params'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var acknowledgedAt = this.acknowledgedAt;
    var appId = this.appId;
    var createdAt = this.createdAt;
    var data = this.data;
    var deletedAt = this.deletedAt;
    var endpointMetadata = this.endpointMetadata;
    var endpoints = this.endpoints;
    var eventType = this.eventType;
    var headers = this.headers;
    var idempotencyKey = this.idempotencyKey;
    var isDuplicateEvent = this.isDuplicateEvent;
    var metadata = this.metadata;
    var projectId = this.projectId;
    var raw = this.raw;
    var sourceId = this.sourceId;
    var sourceMetadata = this.sourceMetadata;
    var status = this.status;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var urlQueryParams = this.urlQueryParams;

    final json = <String, Object?>{};
    if (acknowledgedAt != null) {
      json[r'acknowledged_at'] = acknowledgedAt;
    }
    if (appId != null) {
      json[r'app_id'] = appId;
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (data != null) {
      json[r'data'] = data;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (endpointMetadata != null) {
      json[r'endpoint_metadata'] = endpointMetadata
          .map((i) => i.toJson())
          .toList();
    }
    if (endpoints != null) {
      json[r'endpoints'] = endpoints;
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (headers != null) {
      json[r'headers'] = headers.toJson();
    }
    if (idempotencyKey != null) {
      json[r'idempotency_key'] = idempotencyKey;
    }
    if (isDuplicateEvent != null) {
      json[r'is_duplicate_event'] = isDuplicateEvent;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (raw != null) {
      json[r'raw'] = raw;
    }
    if (sourceId != null) {
      json[r'source_id'] = sourceId;
    }
    if (sourceMetadata != null) {
      json[r'source_metadata'] = sourceMetadata.toJson();
    }
    if (status != null) {
      json[r'status'] = status.value;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (urlQueryParams != null) {
      json[r'url_query_params'] = urlQueryParams;
    }
    return json;
  }

  DatastoreEvent copyWith({
    String? acknowledgedAt,
    String? appId,
    String? createdAt,
    List<int>? data,
    String? deletedAt,
    List<DatastoreEndpoint>? endpointMetadata,
    List<String>? endpoints,
    String? eventType,
    HttpheaderHTTPHeader? headers,
    String? idempotencyKey,
    bool? isDuplicateEvent,
    String? metadata,
    String? projectId,
    String? raw,
    String? sourceId,
    DatastoreSource? sourceMetadata,
    DatastoreEventStatus? status,
    String? uid,
    String? updatedAt,
    String? urlQueryParams,
  }) {
    return DatastoreEvent(
      acknowledgedAt: acknowledgedAt ?? this.acknowledgedAt,
      appId: appId ?? this.appId,
      createdAt: createdAt ?? this.createdAt,
      data: data ?? this.data,
      deletedAt: deletedAt ?? this.deletedAt,
      endpointMetadata: endpointMetadata ?? this.endpointMetadata,
      endpoints: endpoints ?? this.endpoints,
      eventType: eventType ?? this.eventType,
      headers: headers ?? this.headers,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      isDuplicateEvent: isDuplicateEvent ?? this.isDuplicateEvent,
      metadata: metadata ?? this.metadata,
      projectId: projectId ?? this.projectId,
      raw: raw ?? this.raw,
      sourceId: sourceId ?? this.sourceId,
      sourceMetadata: sourceMetadata ?? this.sourceMetadata,
      status: status ?? this.status,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      urlQueryParams: urlQueryParams ?? this.urlQueryParams,
    );
  }
}

class DatastoreFilterConfiguration {
  final List<String>? eventTypes;
  final DatastoreFilterSchema? filter;

  DatastoreFilterConfiguration({this.eventTypes, this.filter});

  factory DatastoreFilterConfiguration.fromJson(Map<String, Object?> json) {
    return DatastoreFilterConfiguration(
      eventTypes: (json[r'event_types'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      filter: json[r'filter'] != null
          ? DatastoreFilterSchema.fromJson(
              json[r'filter']! as Map<String, Object?>,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var eventTypes = this.eventTypes;
    var filter = this.filter;

    final json = <String, Object?>{};
    if (eventTypes != null) {
      json[r'event_types'] = eventTypes;
    }
    if (filter != null) {
      json[r'filter'] = filter.toJson();
    }
    return json;
  }

  DatastoreFilterConfiguration copyWith({
    List<String>? eventTypes,
    DatastoreFilterSchema? filter,
  }) {
    return DatastoreFilterConfiguration(
      eventTypes: eventTypes ?? this.eventTypes,
      filter: filter ?? this.filter,
    );
  }
}

class DatastoreFilterSchema {
  final DatastoreM? body;
  final DatastoreM? headers;
  final bool? isFlattened;

  DatastoreFilterSchema({this.body, this.headers, this.isFlattened});

  factory DatastoreFilterSchema.fromJson(Map<String, Object?> json) {
    return DatastoreFilterSchema(
      body: json[r'body'] != null
          ? DatastoreM.fromJson(json[r'body']! as Map<String, Object?>)
          : null,
      headers: json[r'headers'] != null
          ? DatastoreM.fromJson(json[r'headers']! as Map<String, Object?>)
          : null,
      isFlattened: json[r'is_flattened'] as bool?,
    );
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var headers = this.headers;
    var isFlattened = this.isFlattened;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body.toJson();
    }
    if (headers != null) {
      json[r'headers'] = headers.toJson();
    }
    if (isFlattened != null) {
      json[r'is_flattened'] = isFlattened;
    }
    return json;
  }

  DatastoreFilterSchema copyWith({
    DatastoreM? body,
    DatastoreM? headers,
    bool? isFlattened,
  }) {
    return DatastoreFilterSchema(
      body: body ?? this.body,
      headers: headers ?? this.headers,
      isFlattened: isFlattened ?? this.isFlattened,
    );
  }
}

class DatastoreGooglePubSubConfig {
  final String? projectId;
  final List<int>? serviceAccount;
  final String? subscriptionId;

  DatastoreGooglePubSubConfig({
    this.projectId,
    this.serviceAccount,
    this.subscriptionId,
  });

  factory DatastoreGooglePubSubConfig.fromJson(Map<String, Object?> json) {
    return DatastoreGooglePubSubConfig(
      projectId: json[r'project_id'] as String?,
      serviceAccount: (json[r'service_account'] as List<Object?>?)
          ?.map((i) => (i as num?)?.toInt() ?? 0)
          .toList(),
      subscriptionId: json[r'subscription_id'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var projectId = this.projectId;
    var serviceAccount = this.serviceAccount;
    var subscriptionId = this.subscriptionId;

    final json = <String, Object?>{};
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (serviceAccount != null) {
      json[r'service_account'] = serviceAccount;
    }
    if (subscriptionId != null) {
      json[r'subscription_id'] = subscriptionId;
    }
    return json;
  }

  DatastoreGooglePubSubConfig copyWith({
    String? projectId,
    List<int>? serviceAccount,
    String? subscriptionId,
  }) {
    return DatastoreGooglePubSubConfig(
      projectId: projectId ?? this.projectId,
      serviceAccount: serviceAccount ?? this.serviceAccount,
      subscriptionId: subscriptionId ?? this.subscriptionId,
    );
  }
}

class DatastoreHMac {
  final DatastoreEncodingType? encoding;
  final String? hash;
  final String? header;
  final String? secret;

  DatastoreHMac({this.encoding, this.hash, this.header, this.secret});

  factory DatastoreHMac.fromJson(Map<String, Object?> json) {
    return DatastoreHMac(
      encoding: json[r'encoding'] != null
          ? DatastoreEncodingType.fromValue(json[r'encoding']! as String)
          : null,
      hash: json[r'hash'] as String?,
      header: json[r'header'] as String?,
      secret: json[r'secret'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var encoding = this.encoding;
    var hash = this.hash;
    var header = this.header;
    var secret = this.secret;

    final json = <String, Object?>{};
    if (encoding != null) {
      json[r'encoding'] = encoding.value;
    }
    if (hash != null) {
      json[r'hash'] = hash;
    }
    if (header != null) {
      json[r'header'] = header;
    }
    if (secret != null) {
      json[r'secret'] = secret;
    }
    return json;
  }

  DatastoreHMac copyWith({
    DatastoreEncodingType? encoding,
    String? hash,
    String? header,
    String? secret,
  }) {
    return DatastoreHMac(
      encoding: encoding ?? this.encoding,
      hash: hash ?? this.hash,
      header: header ?? this.header,
      secret: secret ?? this.secret,
    );
  }
}

extension type DatastoreHttpHeader(Map<String, dynamic> map)
    implements Map<String, dynamic> {
  static DatastoreHttpHeader fromJson(Map<String, dynamic> json) =>
      DatastoreHttpHeader(json);
  Map<String, dynamic> toJson() => map;
}

class DatastoreKafkaAuth {
  final String? hash;
  final String? password;
  final bool? tls;
  final String? type;
  final String? username;

  DatastoreKafkaAuth({
    this.hash,
    this.password,
    this.tls,
    this.type,
    this.username,
  });

  factory DatastoreKafkaAuth.fromJson(Map<String, Object?> json) {
    return DatastoreKafkaAuth(
      hash: json[r'hash'] as String?,
      password: json[r'password'] as String?,
      tls: json[r'tls'] as bool?,
      type: json[r'type'] as String?,
      username: json[r'username'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var hash = this.hash;
    var password = this.password;
    var tls = this.tls;
    var type = this.type;
    var username = this.username;

    final json = <String, Object?>{};
    if (hash != null) {
      json[r'hash'] = hash;
    }
    if (password != null) {
      json[r'password'] = password;
    }
    if (tls != null) {
      json[r'tls'] = tls;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    if (username != null) {
      json[r'username'] = username;
    }
    return json;
  }

  DatastoreKafkaAuth copyWith({
    String? hash,
    String? password,
    bool? tls,
    String? type,
    String? username,
  }) {
    return DatastoreKafkaAuth(
      hash: hash ?? this.hash,
      password: password ?? this.password,
      tls: tls ?? this.tls,
      type: type ?? this.type,
      username: username ?? this.username,
    );
  }
}

class DatastoreKafkaPubSubConfig {
  final DatastoreKafkaAuth? auth;
  final List<String>? brokers;
  final String? consumerGroupId;
  final String? topicName;

  DatastoreKafkaPubSubConfig({
    this.auth,
    this.brokers,
    this.consumerGroupId,
    this.topicName,
  });

  factory DatastoreKafkaPubSubConfig.fromJson(Map<String, Object?> json) {
    return DatastoreKafkaPubSubConfig(
      auth: json[r'auth'] != null
          ? DatastoreKafkaAuth.fromJson(json[r'auth']! as Map<String, Object?>)
          : null,
      brokers: (json[r'brokers'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      consumerGroupId: json[r'consumer_group_id'] as String?,
      topicName: json[r'topic_name'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var auth = this.auth;
    var brokers = this.brokers;
    var consumerGroupId = this.consumerGroupId;
    var topicName = this.topicName;

    final json = <String, Object?>{};
    if (auth != null) {
      json[r'auth'] = auth.toJson();
    }
    if (brokers != null) {
      json[r'brokers'] = brokers;
    }
    if (consumerGroupId != null) {
      json[r'consumer_group_id'] = consumerGroupId;
    }
    if (topicName != null) {
      json[r'topic_name'] = topicName;
    }
    return json;
  }

  DatastoreKafkaPubSubConfig copyWith({
    DatastoreKafkaAuth? auth,
    List<String>? brokers,
    String? consumerGroupId,
    String? topicName,
  }) {
    return DatastoreKafkaPubSubConfig(
      auth: auth ?? this.auth,
      brokers: brokers ?? this.brokers,
      consumerGroupId: consumerGroupId ?? this.consumerGroupId,
      topicName: topicName ?? this.topicName,
    );
  }
}

extension type DatastoreM(Map<String, dynamic> map)
    implements Map<String, dynamic> {
  static DatastoreM fromJson(Map<String, dynamic> json) => DatastoreM(json);
  Map<String, dynamic> toJson() => map;
}

class DatastoreMetaEventAttempt {
  final DatastoreHttpHeader? requestHttpHeader;
  final String? responseData;
  final DatastoreHttpHeader? responseHttpHeader;

  DatastoreMetaEventAttempt({
    this.requestHttpHeader,
    this.responseData,
    this.responseHttpHeader,
  });

  factory DatastoreMetaEventAttempt.fromJson(Map<String, Object?> json) {
    return DatastoreMetaEventAttempt(
      requestHttpHeader: json[r'request_http_header'] != null
          ? DatastoreHttpHeader.fromJson(
              json[r'request_http_header']! as Map<String, Object?>,
            )
          : null,
      responseData: json[r'response_data'] as String?,
      responseHttpHeader: json[r'response_http_header'] != null
          ? DatastoreHttpHeader.fromJson(
              json[r'response_http_header']! as Map<String, Object?>,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var requestHttpHeader = this.requestHttpHeader;
    var responseData = this.responseData;
    var responseHttpHeader = this.responseHttpHeader;

    final json = <String, Object?>{};
    if (requestHttpHeader != null) {
      json[r'request_http_header'] = requestHttpHeader.toJson();
    }
    if (responseData != null) {
      json[r'response_data'] = responseData;
    }
    if (responseHttpHeader != null) {
      json[r'response_http_header'] = responseHttpHeader.toJson();
    }
    return json;
  }

  DatastoreMetaEventAttempt copyWith({
    DatastoreHttpHeader? requestHttpHeader,
    String? responseData,
    DatastoreHttpHeader? responseHttpHeader,
  }) {
    return DatastoreMetaEventAttempt(
      requestHttpHeader: requestHttpHeader ?? this.requestHttpHeader,
      responseData: responseData ?? this.responseData,
      responseHttpHeader: responseHttpHeader ?? this.responseHttpHeader,
    );
  }
}

class DatastoreMetadata {
  /// Data to be sent to endpoint.
  final List<int>? data;
  final int? intervalSeconds;
  final int? maxRetrySeconds;
  final String? nextSendTime;

  /// NumTrials: number of times we have tried to deliver this Event to
  /// an application
  final int? numTrials;
  final String? raw;
  final int? retryLimit;
  final DatastoreStrategyProvider? strategy;

  DatastoreMetadata({
    this.data,
    this.intervalSeconds,
    this.maxRetrySeconds,
    this.nextSendTime,
    this.numTrials,
    this.raw,
    this.retryLimit,
    this.strategy,
  });

  factory DatastoreMetadata.fromJson(Map<String, Object?> json) {
    return DatastoreMetadata(
      data: (json[r'data'] as List<Object?>?)
          ?.map((i) => (i as num?)?.toInt() ?? 0)
          .toList(),
      intervalSeconds: (json[r'interval_seconds'] as num?)?.toInt(),
      maxRetrySeconds: (json[r'max_retry_seconds'] as num?)?.toInt(),
      nextSendTime: json[r'next_send_time'] as String?,
      numTrials: (json[r'num_trials'] as num?)?.toInt(),
      raw: json[r'raw'] as String?,
      retryLimit: (json[r'retry_limit'] as num?)?.toInt(),
      strategy: json[r'strategy'] != null
          ? DatastoreStrategyProvider.fromValue(json[r'strategy']! as String)
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var data = this.data;
    var intervalSeconds = this.intervalSeconds;
    var maxRetrySeconds = this.maxRetrySeconds;
    var nextSendTime = this.nextSendTime;
    var numTrials = this.numTrials;
    var raw = this.raw;
    var retryLimit = this.retryLimit;
    var strategy = this.strategy;

    final json = <String, Object?>{};
    if (data != null) {
      json[r'data'] = data;
    }
    if (intervalSeconds != null) {
      json[r'interval_seconds'] = intervalSeconds;
    }
    if (maxRetrySeconds != null) {
      json[r'max_retry_seconds'] = maxRetrySeconds;
    }
    if (nextSendTime != null) {
      json[r'next_send_time'] = nextSendTime;
    }
    if (numTrials != null) {
      json[r'num_trials'] = numTrials;
    }
    if (raw != null) {
      json[r'raw'] = raw;
    }
    if (retryLimit != null) {
      json[r'retry_limit'] = retryLimit;
    }
    if (strategy != null) {
      json[r'strategy'] = strategy.value;
    }
    return json;
  }

  DatastoreMetadata copyWith({
    List<int>? data,
    int? intervalSeconds,
    int? maxRetrySeconds,
    String? nextSendTime,
    int? numTrials,
    String? raw,
    int? retryLimit,
    DatastoreStrategyProvider? strategy,
  }) {
    return DatastoreMetadata(
      data: data ?? this.data,
      intervalSeconds: intervalSeconds ?? this.intervalSeconds,
      maxRetrySeconds: maxRetrySeconds ?? this.maxRetrySeconds,
      nextSendTime: nextSendTime ?? this.nextSendTime,
      numTrials: numTrials ?? this.numTrials,
      raw: raw ?? this.raw,
      retryLimit: retryLimit ?? this.retryLimit,
      strategy: strategy ?? this.strategy,
    );
  }
}

class DatastoreMtlsClientCert {
  /// ClientCert is the client certificate PEM string
  final String? clientCert;

  /// ClientKey is the client private key PEM string
  final String? clientKey;

  DatastoreMtlsClientCert({this.clientCert, this.clientKey});

  factory DatastoreMtlsClientCert.fromJson(Map<String, Object?> json) {
    return DatastoreMtlsClientCert(
      clientCert: json[r'client_cert'] as String?,
      clientKey: json[r'client_key'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var clientCert = this.clientCert;
    var clientKey = this.clientKey;

    final json = <String, Object?>{};
    if (clientCert != null) {
      json[r'client_cert'] = clientCert;
    }
    if (clientKey != null) {
      json[r'client_key'] = clientKey;
    }
    return json;
  }

  DatastoreMtlsClientCert copyWith({String? clientCert, String? clientKey}) {
    return DatastoreMtlsClientCert(
      clientCert: clientCert ?? this.clientCert,
      clientKey: clientKey ?? this.clientKey,
    );
  }
}

class DatastoreOAuth2 {
  final String? audience;
  final DatastoreOAuth2AuthenticationType? authenticationType;
  final String? clientId;

  /// Encrypted at rest
  final String? clientSecret;

  /// Expiry time unit (seconds, milliseconds, minutes, hours)
  final DatastoreOAuth2ExpiryTimeUnit? expiryTimeUnit;

  /// Field mapping for flexible token response parsing
  final DatastoreOAuth2FieldMapping? fieldMapping;
  final String? grantType;
  final String? issuer;
  final String? scope;
  final String? signingAlgorithm;

  /// Encrypted at rest
  final DatastoreOAuth2SigningKey? signingKey;
  final String? subject;
  final String? url;

  DatastoreOAuth2({
    this.audience,
    this.authenticationType,
    this.clientId,
    this.clientSecret,
    this.expiryTimeUnit,
    this.fieldMapping,
    this.grantType,
    this.issuer,
    this.scope,
    this.signingAlgorithm,
    this.signingKey,
    this.subject,
    this.url,
  });

  factory DatastoreOAuth2.fromJson(Map<String, Object?> json) {
    return DatastoreOAuth2(
      audience: json[r'audience'] as String?,
      authenticationType: json[r'authentication_type'] != null
          ? DatastoreOAuth2AuthenticationType.fromValue(
              json[r'authentication_type']! as String,
            )
          : null,
      clientId: json[r'client_id'] as String?,
      clientSecret: json[r'client_secret'] as String?,
      expiryTimeUnit: json[r'expiry_time_unit'] != null
          ? DatastoreOAuth2ExpiryTimeUnit.fromValue(
              json[r'expiry_time_unit']! as String,
            )
          : null,
      fieldMapping: json[r'field_mapping'] != null
          ? DatastoreOAuth2FieldMapping.fromJson(
              json[r'field_mapping']! as Map<String, Object?>,
            )
          : null,
      grantType: json[r'grant_type'] as String?,
      issuer: json[r'issuer'] as String?,
      scope: json[r'scope'] as String?,
      signingAlgorithm: json[r'signing_algorithm'] as String?,
      signingKey: json[r'signing_key'] != null
          ? DatastoreOAuth2SigningKey.fromJson(
              json[r'signing_key']! as Map<String, Object?>,
            )
          : null,
      subject: json[r'subject'] as String?,
      url: json[r'url'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var audience = this.audience;
    var authenticationType = this.authenticationType;
    var clientId = this.clientId;
    var clientSecret = this.clientSecret;
    var expiryTimeUnit = this.expiryTimeUnit;
    var fieldMapping = this.fieldMapping;
    var grantType = this.grantType;
    var issuer = this.issuer;
    var scope = this.scope;
    var signingAlgorithm = this.signingAlgorithm;
    var signingKey = this.signingKey;
    var subject = this.subject;
    var url = this.url;

    final json = <String, Object?>{};
    if (audience != null) {
      json[r'audience'] = audience;
    }
    if (authenticationType != null) {
      json[r'authentication_type'] = authenticationType.value;
    }
    if (clientId != null) {
      json[r'client_id'] = clientId;
    }
    if (clientSecret != null) {
      json[r'client_secret'] = clientSecret;
    }
    if (expiryTimeUnit != null) {
      json[r'expiry_time_unit'] = expiryTimeUnit.value;
    }
    if (fieldMapping != null) {
      json[r'field_mapping'] = fieldMapping.toJson();
    }
    if (grantType != null) {
      json[r'grant_type'] = grantType;
    }
    if (issuer != null) {
      json[r'issuer'] = issuer;
    }
    if (scope != null) {
      json[r'scope'] = scope;
    }
    if (signingAlgorithm != null) {
      json[r'signing_algorithm'] = signingAlgorithm;
    }
    if (signingKey != null) {
      json[r'signing_key'] = signingKey.toJson();
    }
    if (subject != null) {
      json[r'subject'] = subject;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    return json;
  }

  DatastoreOAuth2 copyWith({
    String? audience,
    DatastoreOAuth2AuthenticationType? authenticationType,
    String? clientId,
    String? clientSecret,
    DatastoreOAuth2ExpiryTimeUnit? expiryTimeUnit,
    DatastoreOAuth2FieldMapping? fieldMapping,
    String? grantType,
    String? issuer,
    String? scope,
    String? signingAlgorithm,
    DatastoreOAuth2SigningKey? signingKey,
    String? subject,
    String? url,
  }) {
    return DatastoreOAuth2(
      audience: audience ?? this.audience,
      authenticationType: authenticationType ?? this.authenticationType,
      clientId: clientId ?? this.clientId,
      clientSecret: clientSecret ?? this.clientSecret,
      expiryTimeUnit: expiryTimeUnit ?? this.expiryTimeUnit,
      fieldMapping: fieldMapping ?? this.fieldMapping,
      grantType: grantType ?? this.grantType,
      issuer: issuer ?? this.issuer,
      scope: scope ?? this.scope,
      signingAlgorithm: signingAlgorithm ?? this.signingAlgorithm,
      signingKey: signingKey ?? this.signingKey,
      subject: subject ?? this.subject,
      url: url ?? this.url,
    );
  }
}

class DatastoreOAuth2FieldMapping {
  /// Field name for access token (e.g., "accessToken", "access_token", "token")
  final String? accessToken;

  /// Field name for expiry time (e.g., "expiresIn", "expires_in", "expiresAt")
  final String? expiresIn;

  /// Field name for token type (e.g., "tokenType", "token_type")
  final String? tokenType;

  DatastoreOAuth2FieldMapping({
    this.accessToken,
    this.expiresIn,
    this.tokenType,
  });

  factory DatastoreOAuth2FieldMapping.fromJson(Map<String, Object?> json) {
    return DatastoreOAuth2FieldMapping(
      accessToken: json[r'access_token'] as String?,
      expiresIn: json[r'expires_in'] as String?,
      tokenType: json[r'token_type'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var accessToken = this.accessToken;
    var expiresIn = this.expiresIn;
    var tokenType = this.tokenType;

    final json = <String, Object?>{};
    if (accessToken != null) {
      json[r'access_token'] = accessToken;
    }
    if (expiresIn != null) {
      json[r'expires_in'] = expiresIn;
    }
    if (tokenType != null) {
      json[r'token_type'] = tokenType;
    }
    return json;
  }

  DatastoreOAuth2FieldMapping copyWith({
    String? accessToken,
    String? expiresIn,
    String? tokenType,
  }) {
    return DatastoreOAuth2FieldMapping(
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      tokenType: tokenType ?? this.tokenType,
    );
  }
}

class DatastoreOAuth2SigningKey {
  /// EC (Elliptic Curve) key fields
  final String? crv;

  /// Private key (EC only)
  final String? d;

  /// RSA first factor CRT exponent (RSA private key only)
  final String? dp;

  /// RSA second factor CRT exponent (RSA private key only)
  final String? dq;

  /// RSA public exponent (RSA only)
  final String? e;

  /// Key ID
  final String? kid;

  /// Key type: "EC" or "RSA"
  final String? kty;

  /// RSA key fields
  final String? n;

  /// RSA first prime factor (RSA private key only)
  final String? p;

  /// RSA second prime factor (RSA private key only)
  final String? q;

  /// RSA first CRT coefficient (RSA private key only)
  final String? qi;

  /// X coordinate (EC only)
  final String? x;

  /// Y coordinate (EC only)
  final String? y;

  DatastoreOAuth2SigningKey({
    this.crv,
    this.d,
    this.dp,
    this.dq,
    this.e,
    this.kid,
    this.kty,
    this.n,
    this.p,
    this.q,
    this.qi,
    this.x,
    this.y,
  });

  factory DatastoreOAuth2SigningKey.fromJson(Map<String, Object?> json) {
    return DatastoreOAuth2SigningKey(
      crv: json[r'crv'] as String?,
      d: json[r'd'] as String?,
      dp: json[r'dp'] as String?,
      dq: json[r'dq'] as String?,
      e: json[r'e'] as String?,
      kid: json[r'kid'] as String?,
      kty: json[r'kty'] as String?,
      n: json[r'n'] as String?,
      p: json[r'p'] as String?,
      q: json[r'q'] as String?,
      qi: json[r'qi'] as String?,
      x: json[r'x'] as String?,
      y: json[r'y'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var crv = this.crv;
    var d = this.d;
    var dp = this.dp;
    var dq = this.dq;
    var e = this.e;
    var kid = this.kid;
    var kty = this.kty;
    var n = this.n;
    var p = this.p;
    var q = this.q;
    var qi = this.qi;
    var x = this.x;
    var y = this.y;

    final json = <String, Object?>{};
    if (crv != null) {
      json[r'crv'] = crv;
    }
    if (d != null) {
      json[r'd'] = d;
    }
    if (dp != null) {
      json[r'dp'] = dp;
    }
    if (dq != null) {
      json[r'dq'] = dq;
    }
    if (e != null) {
      json[r'e'] = e;
    }
    if (kid != null) {
      json[r'kid'] = kid;
    }
    if (kty != null) {
      json[r'kty'] = kty;
    }
    if (n != null) {
      json[r'n'] = n;
    }
    if (p != null) {
      json[r'p'] = p;
    }
    if (q != null) {
      json[r'q'] = q;
    }
    if (qi != null) {
      json[r'qi'] = qi;
    }
    if (x != null) {
      json[r'x'] = x;
    }
    if (y != null) {
      json[r'y'] = y;
    }
    return json;
  }

  DatastoreOAuth2SigningKey copyWith({
    String? crv,
    String? d,
    String? dp,
    String? dq,
    String? e,
    String? kid,
    String? kty,
    String? n,
    String? p,
    String? q,
    String? qi,
    String? x,
    String? y,
  }) {
    return DatastoreOAuth2SigningKey(
      crv: crv ?? this.crv,
      d: d ?? this.d,
      dp: dp ?? this.dp,
      dq: dq ?? this.dq,
      e: e ?? this.e,
      kid: kid ?? this.kid,
      kty: kty ?? this.kty,
      n: n ?? this.n,
      p: p ?? this.p,
      q: q ?? this.q,
      qi: qi ?? this.qi,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }
}

class DatastorePaginationData {
  final bool? hasNextPage;
  final bool? hasPrevPage;
  final String? nextPageCursor;
  final int? perPage;
  final String? prevPageCursor;

  DatastorePaginationData({
    this.hasNextPage,
    this.hasPrevPage,
    this.nextPageCursor,
    this.perPage,
    this.prevPageCursor,
  });

  factory DatastorePaginationData.fromJson(Map<String, Object?> json) {
    return DatastorePaginationData(
      hasNextPage: json[r'has_next_page'] as bool?,
      hasPrevPage: json[r'has_prev_page'] as bool?,
      nextPageCursor: json[r'next_page_cursor'] as String?,
      perPage: (json[r'per_page'] as num?)?.toInt(),
      prevPageCursor: json[r'prev_page_cursor'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var hasNextPage = this.hasNextPage;
    var hasPrevPage = this.hasPrevPage;
    var nextPageCursor = this.nextPageCursor;
    var perPage = this.perPage;
    var prevPageCursor = this.prevPageCursor;

    final json = <String, Object?>{};
    if (hasNextPage != null) {
      json[r'has_next_page'] = hasNextPage;
    }
    if (hasPrevPage != null) {
      json[r'has_prev_page'] = hasPrevPage;
    }
    if (nextPageCursor != null) {
      json[r'next_page_cursor'] = nextPageCursor;
    }
    if (perPage != null) {
      json[r'per_page'] = perPage;
    }
    if (prevPageCursor != null) {
      json[r'prev_page_cursor'] = prevPageCursor;
    }
    return json;
  }

  DatastorePaginationData copyWith({
    bool? hasNextPage,
    bool? hasPrevPage,
    String? nextPageCursor,
    int? perPage,
    String? prevPageCursor,
  }) {
    return DatastorePaginationData(
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasPrevPage: hasPrevPage ?? this.hasPrevPage,
      nextPageCursor: nextPageCursor ?? this.nextPageCursor,
      perPage: perPage ?? this.perPage,
      prevPageCursor: prevPageCursor ?? this.prevPageCursor,
    );
  }
}

class DatastorePortalLinkResponse {
  final String? authKey;
  final DatastorePortalAuthType? authType;
  final bool? canManageEndpoint;
  final String? createdAt;
  final String? deletedAt;
  final int? endpointCount;
  final List<String>? endpoints;
  final List<DatastoreEndpoint>? endpointsMetadata;
  final String? name;
  final String? ownerId;
  final String? projectId;
  final String? token;
  final String? uid;
  final String? updatedAt;
  final String? url;

  DatastorePortalLinkResponse({
    this.authKey,
    this.authType,
    this.canManageEndpoint,
    this.createdAt,
    this.deletedAt,
    this.endpointCount,
    this.endpoints,
    this.endpointsMetadata,
    this.name,
    this.ownerId,
    this.projectId,
    this.token,
    this.uid,
    this.updatedAt,
    this.url,
  });

  factory DatastorePortalLinkResponse.fromJson(Map<String, Object?> json) {
    return DatastorePortalLinkResponse(
      authKey: json[r'auth_key'] as String?,
      authType: json[r'auth_type'] != null
          ? DatastorePortalAuthType.fromValue(json[r'auth_type']! as String)
          : null,
      canManageEndpoint: json[r'can_manage_endpoint'] as bool?,
      createdAt: json[r'created_at'] as String?,
      deletedAt: json[r'deleted_at'] as String?,
      endpointCount: (json[r'endpoint_count'] as num?)?.toInt(),
      endpoints: (json[r'endpoints'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      endpointsMetadata: (json[r'endpoints_metadata'] as List<Object?>?)
          ?.map(
            (i) => DatastoreEndpoint.fromJson(
              i as Map<String, Object?>? ?? const {},
            ),
          )
          .toList(),
      name: json[r'name'] as String?,
      ownerId: json[r'owner_id'] as String?,
      projectId: json[r'project_id'] as String?,
      token: json[r'token'] as String?,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      url: json[r'url'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var authKey = this.authKey;
    var authType = this.authType;
    var canManageEndpoint = this.canManageEndpoint;
    var createdAt = this.createdAt;
    var deletedAt = this.deletedAt;
    var endpointCount = this.endpointCount;
    var endpoints = this.endpoints;
    var endpointsMetadata = this.endpointsMetadata;
    var name = this.name;
    var ownerId = this.ownerId;
    var projectId = this.projectId;
    var token = this.token;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var url = this.url;

    final json = <String, Object?>{};
    if (authKey != null) {
      json[r'auth_key'] = authKey;
    }
    if (authType != null) {
      json[r'auth_type'] = authType.value;
    }
    if (canManageEndpoint != null) {
      json[r'can_manage_endpoint'] = canManageEndpoint;
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (endpointCount != null) {
      json[r'endpoint_count'] = endpointCount;
    }
    if (endpoints != null) {
      json[r'endpoints'] = endpoints;
    }
    if (endpointsMetadata != null) {
      json[r'endpoints_metadata'] = endpointsMetadata
          .map((i) => i.toJson())
          .toList();
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (ownerId != null) {
      json[r'owner_id'] = ownerId;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (token != null) {
      json[r'token'] = token;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    return json;
  }

  DatastorePortalLinkResponse copyWith({
    String? authKey,
    DatastorePortalAuthType? authType,
    bool? canManageEndpoint,
    String? createdAt,
    String? deletedAt,
    int? endpointCount,
    List<String>? endpoints,
    List<DatastoreEndpoint>? endpointsMetadata,
    String? name,
    String? ownerId,
    String? projectId,
    String? token,
    String? uid,
    String? updatedAt,
    String? url,
  }) {
    return DatastorePortalLinkResponse(
      authKey: authKey ?? this.authKey,
      authType: authType ?? this.authType,
      canManageEndpoint: canManageEndpoint ?? this.canManageEndpoint,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      endpointCount: endpointCount ?? this.endpointCount,
      endpoints: endpoints ?? this.endpoints,
      endpointsMetadata: endpointsMetadata ?? this.endpointsMetadata,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      projectId: projectId ?? this.projectId,
      token: token ?? this.token,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
    );
  }
}

class DatastoreProviderConfig {
  final DatastoreTwitterProviderConfig? twitter;

  DatastoreProviderConfig({this.twitter});

  factory DatastoreProviderConfig.fromJson(Map<String, Object?> json) {
    return DatastoreProviderConfig(
      twitter: json[r'twitter'] != null
          ? DatastoreTwitterProviderConfig.fromJson(
              json[r'twitter']! as Map<String, Object?>,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var twitter = this.twitter;

    final json = <String, Object?>{};
    if (twitter != null) {
      json[r'twitter'] = twitter.toJson();
    }
    return json;
  }

  DatastoreProviderConfig copyWith({DatastoreTwitterProviderConfig? twitter}) {
    return DatastoreProviderConfig(twitter: twitter ?? this.twitter);
  }
}

class DatastorePubSubConfig {
  final DatastoreAmqpPubSubConfig? amqp;
  final DatastoreGooglePubSubConfig? google;
  final DatastoreKafkaPubSubConfig? kafka;
  final DatastoreSQSPubSubConfig? sqs;
  final DatastorePubSubType? type;
  final int? workers;

  DatastorePubSubConfig({
    this.amqp,
    this.google,
    this.kafka,
    this.sqs,
    this.type,
    this.workers,
  });

  factory DatastorePubSubConfig.fromJson(Map<String, Object?> json) {
    return DatastorePubSubConfig(
      amqp: json[r'amqp'] != null
          ? DatastoreAmqpPubSubConfig.fromJson(
              json[r'amqp']! as Map<String, Object?>,
            )
          : null,
      google: json[r'google'] != null
          ? DatastoreGooglePubSubConfig.fromJson(
              json[r'google']! as Map<String, Object?>,
            )
          : null,
      kafka: json[r'kafka'] != null
          ? DatastoreKafkaPubSubConfig.fromJson(
              json[r'kafka']! as Map<String, Object?>,
            )
          : null,
      sqs: json[r'sqs'] != null
          ? DatastoreSQSPubSubConfig.fromJson(
              json[r'sqs']! as Map<String, Object?>,
            )
          : null,
      type: json[r'type'] != null
          ? DatastorePubSubType.fromValue(json[r'type']! as String)
          : null,
      workers: (json[r'workers'] as num?)?.toInt(),
    );
  }

  Map<String, Object?> toJson() {
    var amqp = this.amqp;
    var google = this.google;
    var kafka = this.kafka;
    var sqs = this.sqs;
    var type = this.type;
    var workers = this.workers;

    final json = <String, Object?>{};
    if (amqp != null) {
      json[r'amqp'] = amqp.toJson();
    }
    if (google != null) {
      json[r'google'] = google.toJson();
    }
    if (kafka != null) {
      json[r'kafka'] = kafka.toJson();
    }
    if (sqs != null) {
      json[r'sqs'] = sqs.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    if (workers != null) {
      json[r'workers'] = workers;
    }
    return json;
  }

  DatastorePubSubConfig copyWith({
    DatastoreAmqpPubSubConfig? amqp,
    DatastoreGooglePubSubConfig? google,
    DatastoreKafkaPubSubConfig? kafka,
    DatastoreSQSPubSubConfig? sqs,
    DatastorePubSubType? type,
    int? workers,
  }) {
    return DatastorePubSubConfig(
      amqp: amqp ?? this.amqp,
      google: google ?? this.google,
      kafka: kafka ?? this.kafka,
      sqs: sqs ?? this.sqs,
      type: type ?? this.type,
      workers: workers ?? this.workers,
    );
  }
}

class DatastoreRateLimitConfiguration {
  final int? count;
  final int? duration;

  DatastoreRateLimitConfiguration({this.count, this.duration});

  factory DatastoreRateLimitConfiguration.fromJson(Map<String, Object?> json) {
    return DatastoreRateLimitConfiguration(
      count: (json[r'count'] as num?)?.toInt(),
      duration: (json[r'duration'] as num?)?.toInt(),
    );
  }

  Map<String, Object?> toJson() {
    var count = this.count;
    var duration = this.duration;

    final json = <String, Object?>{};
    if (count != null) {
      json[r'count'] = count;
    }
    if (duration != null) {
      json[r'duration'] = duration;
    }
    return json;
  }

  DatastoreRateLimitConfiguration copyWith({int? count, int? duration}) {
    return DatastoreRateLimitConfiguration(
      count: count ?? this.count,
      duration: duration ?? this.duration,
    );
  }
}

class DatastoreRetryConfiguration {
  final int? duration;
  final int? retryCount;
  final DatastoreStrategyProvider? type;

  DatastoreRetryConfiguration({this.duration, this.retryCount, this.type});

  factory DatastoreRetryConfiguration.fromJson(Map<String, Object?> json) {
    return DatastoreRetryConfiguration(
      duration: (json[r'duration'] as num?)?.toInt(),
      retryCount: (json[r'retry_count'] as num?)?.toInt(),
      type: json[r'type'] != null
          ? DatastoreStrategyProvider.fromValue(json[r'type']! as String)
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var duration = this.duration;
    var retryCount = this.retryCount;
    var type = this.type;

    final json = <String, Object?>{};
    if (duration != null) {
      json[r'duration'] = duration;
    }
    if (retryCount != null) {
      json[r'retry_count'] = retryCount;
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    return json;
  }

  DatastoreRetryConfiguration copyWith({
    int? duration,
    int? retryCount,
    DatastoreStrategyProvider? type,
  }) {
    return DatastoreRetryConfiguration(
      duration: duration ?? this.duration,
      retryCount: retryCount ?? this.retryCount,
      type: type ?? this.type,
    );
  }
}

class DatastoreSQSPubSubConfig {
  final String? accessKeyId;
  final String? defaultRegion;

  /// Optional: for LocalStack testing
  final String? endpoint;
  final String? queueName;
  final String? secretKey;

  DatastoreSQSPubSubConfig({
    this.accessKeyId,
    this.defaultRegion,
    this.endpoint,
    this.queueName,
    this.secretKey,
  });

  factory DatastoreSQSPubSubConfig.fromJson(Map<String, Object?> json) {
    return DatastoreSQSPubSubConfig(
      accessKeyId: json[r'access_key_id'] as String?,
      defaultRegion: json[r'default_region'] as String?,
      endpoint: json[r'endpoint'] as String?,
      queueName: json[r'queue_name'] as String?,
      secretKey: json[r'secret_key'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var accessKeyId = this.accessKeyId;
    var defaultRegion = this.defaultRegion;
    var endpoint = this.endpoint;
    var queueName = this.queueName;
    var secretKey = this.secretKey;

    final json = <String, Object?>{};
    if (accessKeyId != null) {
      json[r'access_key_id'] = accessKeyId;
    }
    if (defaultRegion != null) {
      json[r'default_region'] = defaultRegion;
    }
    if (endpoint != null) {
      json[r'endpoint'] = endpoint;
    }
    if (queueName != null) {
      json[r'queue_name'] = queueName;
    }
    if (secretKey != null) {
      json[r'secret_key'] = secretKey;
    }
    return json;
  }

  DatastoreSQSPubSubConfig copyWith({
    String? accessKeyId,
    String? defaultRegion,
    String? endpoint,
    String? queueName,
    String? secretKey,
  }) {
    return DatastoreSQSPubSubConfig(
      accessKeyId: accessKeyId ?? this.accessKeyId,
      defaultRegion: defaultRegion ?? this.defaultRegion,
      endpoint: endpoint ?? this.endpoint,
      queueName: queueName ?? this.queueName,
      secretKey: secretKey ?? this.secretKey,
    );
  }
}

class DatastoreSecret {
  final String? createdAt;
  final String? deletedAt;
  final String? expiresAt;
  final String? uid;
  final String? updatedAt;
  final String? value;

  DatastoreSecret({
    this.createdAt,
    this.deletedAt,
    this.expiresAt,
    this.uid,
    this.updatedAt,
    this.value,
  });

  factory DatastoreSecret.fromJson(Map<String, Object?> json) {
    return DatastoreSecret(
      createdAt: json[r'created_at'] as String?,
      deletedAt: json[r'deleted_at'] as String?,
      expiresAt: json[r'expires_at'] as String?,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      value: json[r'value'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var createdAt = this.createdAt;
    var deletedAt = this.deletedAt;
    var expiresAt = this.expiresAt;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var value = this.value;

    final json = <String, Object?>{};
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (expiresAt != null) {
      json[r'expires_at'] = expiresAt;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (value != null) {
      json[r'value'] = value;
    }
    return json;
  }

  DatastoreSecret copyWith({
    String? createdAt,
    String? deletedAt,
    String? expiresAt,
    String? uid,
    String? updatedAt,
    String? value,
  }) {
    return DatastoreSecret(
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      value: value ?? this.value,
    );
  }
}

class DatastoreSource {
  final String? bodyFunction;
  final String? createdAt;
  final DatastoreCustomResponse? customResponse;
  final String? deletedAt;
  final List<String>? forwardHeaders;
  final String? headerFunction;
  final List<String>? idempotencyKeys;
  final bool? isDisabled;
  final String? maskId;
  final String? name;
  final String? projectId;
  final DatastoreSourceProvider? provider;
  final DatastoreProviderConfig? providerConfig;
  final DatastorePubSubConfig? pubSub;
  final DatastoreSourceType? type;
  final String? uid;
  final String? updatedAt;
  final String? url;
  final DatastoreVerifierConfig? verifier;

  DatastoreSource({
    this.bodyFunction,
    this.createdAt,
    this.customResponse,
    this.deletedAt,
    this.forwardHeaders,
    this.headerFunction,
    this.idempotencyKeys,
    this.isDisabled,
    this.maskId,
    this.name,
    this.projectId,
    this.provider,
    this.providerConfig,
    this.pubSub,
    this.type,
    this.uid,
    this.updatedAt,
    this.url,
    this.verifier,
  });

  factory DatastoreSource.fromJson(Map<String, Object?> json) {
    return DatastoreSource(
      bodyFunction: json[r'body_function'] as String?,
      createdAt: json[r'created_at'] as String?,
      customResponse: json[r'custom_response'] != null
          ? DatastoreCustomResponse.fromJson(
              json[r'custom_response']! as Map<String, Object?>,
            )
          : null,
      deletedAt: json[r'deleted_at'] as String?,
      forwardHeaders: (json[r'forward_headers'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      headerFunction: json[r'header_function'] as String?,
      idempotencyKeys: (json[r'idempotency_keys'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      isDisabled: json[r'is_disabled'] as bool?,
      maskId: json[r'mask_id'] as String?,
      name: json[r'name'] as String?,
      projectId: json[r'project_id'] as String?,
      provider: json[r'provider'] != null
          ? DatastoreSourceProvider.fromValue(json[r'provider']! as String)
          : null,
      providerConfig: json[r'provider_config'] != null
          ? DatastoreProviderConfig.fromJson(
              json[r'provider_config']! as Map<String, Object?>,
            )
          : null,
      pubSub: json[r'pub_sub'] != null
          ? DatastorePubSubConfig.fromJson(
              json[r'pub_sub']! as Map<String, Object?>,
            )
          : null,
      type: json[r'type'] != null
          ? DatastoreSourceType.fromValue(json[r'type']! as String)
          : null,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      url: json[r'url'] as String?,
      verifier: json[r'verifier'] != null
          ? DatastoreVerifierConfig.fromJson(
              json[r'verifier']! as Map<String, Object?>,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var bodyFunction = this.bodyFunction;
    var createdAt = this.createdAt;
    var customResponse = this.customResponse;
    var deletedAt = this.deletedAt;
    var forwardHeaders = this.forwardHeaders;
    var headerFunction = this.headerFunction;
    var idempotencyKeys = this.idempotencyKeys;
    var isDisabled = this.isDisabled;
    var maskId = this.maskId;
    var name = this.name;
    var projectId = this.projectId;
    var provider = this.provider;
    var providerConfig = this.providerConfig;
    var pubSub = this.pubSub;
    var type = this.type;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var url = this.url;
    var verifier = this.verifier;

    final json = <String, Object?>{};
    if (bodyFunction != null) {
      json[r'body_function'] = bodyFunction;
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (customResponse != null) {
      json[r'custom_response'] = customResponse.toJson();
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (forwardHeaders != null) {
      json[r'forward_headers'] = forwardHeaders;
    }
    if (headerFunction != null) {
      json[r'header_function'] = headerFunction;
    }
    if (idempotencyKeys != null) {
      json[r'idempotency_keys'] = idempotencyKeys;
    }
    if (isDisabled != null) {
      json[r'is_disabled'] = isDisabled;
    }
    if (maskId != null) {
      json[r'mask_id'] = maskId;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (provider != null) {
      json[r'provider'] = provider.value;
    }
    if (providerConfig != null) {
      json[r'provider_config'] = providerConfig.toJson();
    }
    if (pubSub != null) {
      json[r'pub_sub'] = pubSub.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    if (verifier != null) {
      json[r'verifier'] = verifier.toJson();
    }
    return json;
  }

  DatastoreSource copyWith({
    String? bodyFunction,
    String? createdAt,
    DatastoreCustomResponse? customResponse,
    String? deletedAt,
    List<String>? forwardHeaders,
    String? headerFunction,
    List<String>? idempotencyKeys,
    bool? isDisabled,
    String? maskId,
    String? name,
    String? projectId,
    DatastoreSourceProvider? provider,
    DatastoreProviderConfig? providerConfig,
    DatastorePubSubConfig? pubSub,
    DatastoreSourceType? type,
    String? uid,
    String? updatedAt,
    String? url,
    DatastoreVerifierConfig? verifier,
  }) {
    return DatastoreSource(
      bodyFunction: bodyFunction ?? this.bodyFunction,
      createdAt: createdAt ?? this.createdAt,
      customResponse: customResponse ?? this.customResponse,
      deletedAt: deletedAt ?? this.deletedAt,
      forwardHeaders: forwardHeaders ?? this.forwardHeaders,
      headerFunction: headerFunction ?? this.headerFunction,
      idempotencyKeys: idempotencyKeys ?? this.idempotencyKeys,
      isDisabled: isDisabled ?? this.isDisabled,
      maskId: maskId ?? this.maskId,
      name: name ?? this.name,
      projectId: projectId ?? this.projectId,
      provider: provider ?? this.provider,
      providerConfig: providerConfig ?? this.providerConfig,
      pubSub: pubSub ?? this.pubSub,
      type: type ?? this.type,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
      verifier: verifier ?? this.verifier,
    );
  }
}

class DatastoreTwitterProviderConfig {
  final String? crcVerifiedAt;

  DatastoreTwitterProviderConfig({this.crcVerifiedAt});

  factory DatastoreTwitterProviderConfig.fromJson(Map<String, Object?> json) {
    return DatastoreTwitterProviderConfig(
      crcVerifiedAt: json[r'crc_verified_at'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var crcVerifiedAt = this.crcVerifiedAt;

    final json = <String, Object?>{};
    if (crcVerifiedAt != null) {
      json[r'crc_verified_at'] = crcVerifiedAt;
    }
    return json;
  }

  DatastoreTwitterProviderConfig copyWith({String? crcVerifiedAt}) {
    return DatastoreTwitterProviderConfig(
      crcVerifiedAt: crcVerifiedAt ?? this.crcVerifiedAt,
    );
  }
}

class DatastoreUpdatePortalLinkRequest {
  final String? authType;

  /// Specify whether endpoint management can be done through the Portal Link UI
  final bool? canManageEndpoint;

  /// Deprecated
  /// IDs of endpoints in this portal link
  final List<String>? endpoints;

  /// Portal Link Name
  final String? name;

  /// OwnerID, the portal link will inherit all the endpoints with this owner ID
  final String? ownerId;

  DatastoreUpdatePortalLinkRequest({
    this.authType,
    this.canManageEndpoint,
    this.endpoints,
    this.name,
    this.ownerId,
  });

  factory DatastoreUpdatePortalLinkRequest.fromJson(Map<String, Object?> json) {
    return DatastoreUpdatePortalLinkRequest(
      authType: json[r'auth_type'] as String?,
      canManageEndpoint: json[r'can_manage_endpoint'] as bool?,
      endpoints: (json[r'endpoints'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      name: json[r'name'] as String?,
      ownerId: json[r'owner_id'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var authType = this.authType;
    var canManageEndpoint = this.canManageEndpoint;
    var endpoints = this.endpoints;
    var name = this.name;
    var ownerId = this.ownerId;

    final json = <String, Object?>{};
    if (authType != null) {
      json[r'auth_type'] = authType;
    }
    if (canManageEndpoint != null) {
      json[r'can_manage_endpoint'] = canManageEndpoint;
    }
    if (endpoints != null) {
      json[r'endpoints'] = endpoints;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (ownerId != null) {
      json[r'owner_id'] = ownerId;
    }
    return json;
  }

  DatastoreUpdatePortalLinkRequest copyWith({
    String? authType,
    bool? canManageEndpoint,
    List<String>? endpoints,
    String? name,
    String? ownerId,
  }) {
    return DatastoreUpdatePortalLinkRequest(
      authType: authType ?? this.authType,
      canManageEndpoint: canManageEndpoint ?? this.canManageEndpoint,
      endpoints: endpoints ?? this.endpoints,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
    );
  }
}

class DatastoreVerifierConfig {
  final DatastoreApiKey? apiKey;
  final DatastoreBasicAuth? basicAuth;
  final DatastoreHMac? hmac;
  final DatastoreVerifierType? type;

  DatastoreVerifierConfig({this.apiKey, this.basicAuth, this.hmac, this.type});

  factory DatastoreVerifierConfig.fromJson(Map<String, Object?> json) {
    return DatastoreVerifierConfig(
      apiKey: json[r'api_key'] != null
          ? DatastoreApiKey.fromJson(json[r'api_key']! as Map<String, Object?>)
          : null,
      basicAuth: json[r'basic_auth'] != null
          ? DatastoreBasicAuth.fromJson(
              json[r'basic_auth']! as Map<String, Object?>,
            )
          : null,
      hmac: json[r'hmac'] != null
          ? DatastoreHMac.fromJson(json[r'hmac']! as Map<String, Object?>)
          : null,
      type: json[r'type'] != null
          ? DatastoreVerifierType.fromValue(json[r'type']! as String)
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var apiKey = this.apiKey;
    var basicAuth = this.basicAuth;
    var hmac = this.hmac;
    var type = this.type;

    final json = <String, Object?>{};
    if (apiKey != null) {
      json[r'api_key'] = apiKey.toJson();
    }
    if (basicAuth != null) {
      json[r'basic_auth'] = basicAuth.toJson();
    }
    if (hmac != null) {
      json[r'hmac'] = hmac.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    return json;
  }

  DatastoreVerifierConfig copyWith({
    DatastoreApiKey? apiKey,
    DatastoreBasicAuth? basicAuth,
    DatastoreHMac? hmac,
    DatastoreVerifierType? type,
  }) {
    return DatastoreVerifierConfig(
      apiKey: apiKey ?? this.apiKey,
      basicAuth: basicAuth ?? this.basicAuth,
      hmac: hmac ?? this.hmac,
      type: type ?? this.type,
    );
  }
}

extension type HandlersStub(Map<String, dynamic> map)
    implements Map<String, dynamic> {
  static HandlersStub fromJson(Map<String, dynamic> json) => HandlersStub(json);
  Map<String, dynamic> toJson() => map;
}

extension type HttpheaderHTTPHeader(Map<String, dynamic> map)
    implements Map<String, dynamic> {
  static HttpheaderHTTPHeader fromJson(Map<String, dynamic> json) =>
      HttpheaderHTTPHeader(json);
  Map<String, dynamic> toJson() => map;
}

class ModelsAlertConfiguration {
  /// Count
  final int? count;

  /// Threshold
  final String? threshold;

  ModelsAlertConfiguration({this.count, this.threshold});

  factory ModelsAlertConfiguration.fromJson(Map<String, Object?> json) {
    return ModelsAlertConfiguration(
      count: (json[r'count'] as num?)?.toInt(),
      threshold: json[r'threshold'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var count = this.count;
    var threshold = this.threshold;

    final json = <String, Object?>{};
    if (count != null) {
      json[r'count'] = count;
    }
    if (threshold != null) {
      json[r'threshold'] = threshold;
    }
    return json;
  }

  ModelsAlertConfiguration copyWith({int? count, String? threshold}) {
    return ModelsAlertConfiguration(
      count: count ?? this.count,
      threshold: threshold ?? this.threshold,
    );
  }
}

class ModelsAmqpAuth {
  final String? password;
  final String? user;

  ModelsAmqpAuth({this.password, this.user});

  factory ModelsAmqpAuth.fromJson(Map<String, Object?> json) {
    return ModelsAmqpAuth(
      password: json[r'password'] as String?,
      user: json[r'user'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var password = this.password;
    var user = this.user;

    final json = <String, Object?>{};
    if (password != null) {
      json[r'password'] = password;
    }
    if (user != null) {
      json[r'user'] = user;
    }
    return json;
  }

  ModelsAmqpAuth copyWith({String? password, String? user}) {
    return ModelsAmqpAuth(
      password: password ?? this.password,
      user: user ?? this.user,
    );
  }
}

class ModelsAmqpExchange {
  final String? exchange;
  final String? routingKey;

  ModelsAmqpExchange({this.exchange, this.routingKey});

  factory ModelsAmqpExchange.fromJson(Map<String, Object?> json) {
    return ModelsAmqpExchange(
      exchange: json[r'exchange'] as String?,
      routingKey: json[r'routingKey'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var exchange = this.exchange;
    var routingKey = this.routingKey;

    final json = <String, Object?>{};
    if (exchange != null) {
      json[r'exchange'] = exchange;
    }
    if (routingKey != null) {
      json[r'routingKey'] = routingKey;
    }
    return json;
  }

  ModelsAmqpExchange copyWith({String? exchange, String? routingKey}) {
    return ModelsAmqpExchange(
      exchange: exchange ?? this.exchange,
      routingKey: routingKey ?? this.routingKey,
    );
  }
}

class ModelsAmqpPubSubconfig {
  final ModelsAmqpAuth? auth;
  final ModelsAmqpExchange? bindExchange;
  final String? deadLetterExchange;
  final String? host;
  final String? port;
  final String? queue;
  final String? schema;
  final String? vhost;

  ModelsAmqpPubSubconfig({
    this.auth,
    this.bindExchange,
    this.deadLetterExchange,
    this.host,
    this.port,
    this.queue,
    this.schema,
    this.vhost,
  });

  factory ModelsAmqpPubSubconfig.fromJson(Map<String, Object?> json) {
    return ModelsAmqpPubSubconfig(
      auth: json[r'auth'] != null
          ? ModelsAmqpAuth.fromJson(json[r'auth']! as Map<String, Object?>)
          : null,
      bindExchange: json[r'bindExchange'] != null
          ? ModelsAmqpExchange.fromJson(
              json[r'bindExchange']! as Map<String, Object?>,
            )
          : null,
      deadLetterExchange: json[r'deadLetterExchange'] as String?,
      host: json[r'host'] as String?,
      port: json[r'port'] as String?,
      queue: json[r'queue'] as String?,
      schema: json[r'schema'] as String?,
      vhost: json[r'vhost'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var auth = this.auth;
    var bindExchange = this.bindExchange;
    var deadLetterExchange = this.deadLetterExchange;
    var host = this.host;
    var port = this.port;
    var queue = this.queue;
    var schema = this.schema;
    var vhost = this.vhost;

    final json = <String, Object?>{};
    if (auth != null) {
      json[r'auth'] = auth.toJson();
    }
    if (bindExchange != null) {
      json[r'bindExchange'] = bindExchange.toJson();
    }
    if (deadLetterExchange != null) {
      json[r'deadLetterExchange'] = deadLetterExchange;
    }
    if (host != null) {
      json[r'host'] = host;
    }
    if (port != null) {
      json[r'port'] = port;
    }
    if (queue != null) {
      json[r'queue'] = queue;
    }
    if (schema != null) {
      json[r'schema'] = schema;
    }
    if (vhost != null) {
      json[r'vhost'] = vhost;
    }
    return json;
  }

  ModelsAmqpPubSubconfig copyWith({
    ModelsAmqpAuth? auth,
    ModelsAmqpExchange? bindExchange,
    String? deadLetterExchange,
    String? host,
    String? port,
    String? queue,
    String? schema,
    String? vhost,
  }) {
    return ModelsAmqpPubSubconfig(
      auth: auth ?? this.auth,
      bindExchange: bindExchange ?? this.bindExchange,
      deadLetterExchange: deadLetterExchange ?? this.deadLetterExchange,
      host: host ?? this.host,
      port: port ?? this.port,
      queue: queue ?? this.queue,
      schema: schema ?? this.schema,
      vhost: vhost ?? this.vhost,
    );
  }
}

class ModelsApiKey {
  final String headerName;
  final String headerValue;

  ModelsApiKey({required this.headerName, required this.headerValue});

  factory ModelsApiKey.fromJson(Map<String, Object?> json) {
    return ModelsApiKey(
      headerName: json[r'header_name'] as String? ?? '',
      headerValue: json[r'header_value'] as String? ?? '',
    );
  }

  Map<String, Object?> toJson() {
    var headerName = this.headerName;
    var headerValue = this.headerValue;

    final json = <String, Object?>{};
    json[r'header_name'] = headerName;
    json[r'header_value'] = headerValue;
    return json;
  }

  ModelsApiKey copyWith({String? headerName, String? headerValue}) {
    return ModelsApiKey(
      headerName: headerName ?? this.headerName,
      headerValue: headerValue ?? this.headerValue,
    );
  }
}

class ModelsBasicAuth {
  final String password;
  final String username;

  ModelsBasicAuth({required this.password, required this.username});

  factory ModelsBasicAuth.fromJson(Map<String, Object?> json) {
    return ModelsBasicAuth(
      password: json[r'password'] as String? ?? '',
      username: json[r'username'] as String? ?? '',
    );
  }

  Map<String, Object?> toJson() {
    var password = this.password;
    var username = this.username;

    final json = <String, Object?>{};
    json[r'password'] = password;
    json[r'username'] = username;
    return json;
  }

  ModelsBasicAuth copyWith({String? password, String? username}) {
    return ModelsBasicAuth(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }
}

class ModelsBroadcastEvent {
  final String? acknowledgedAt;

  /// Specifies custom headers you want convoy to add when the event is
  /// dispatched to your endpoint
  final Map<String, Object?>? customHeaders;

  /// Data is an arbitrary JSON value that gets sent as the body of the
  /// webhook to the endpoints
  final Map<String, Object?>? data;

  /// Event Type is used for filtering and debugging e.g invoice.paid
  final String? eventType;

  /// Specify a key for event deduplication
  final String? idempotencyKey;

  ModelsBroadcastEvent({
    this.acknowledgedAt,
    this.customHeaders,
    this.data,
    this.eventType,
    this.idempotencyKey,
  });

  factory ModelsBroadcastEvent.fromJson(Map<String, Object?> json) {
    return ModelsBroadcastEvent(
      acknowledgedAt: json[r'acknowledged_at'] as String?,
      customHeaders: json[r'custom_headers'] as Map<String, Object?>?,
      data: json[r'data'] as Map<String, Object?>?,
      eventType: json[r'event_type'] as String?,
      idempotencyKey: json[r'idempotency_key'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var acknowledgedAt = this.acknowledgedAt;
    var customHeaders = this.customHeaders;
    var data = this.data;
    var eventType = this.eventType;
    var idempotencyKey = this.idempotencyKey;

    final json = <String, Object?>{};
    if (acknowledgedAt != null) {
      json[r'acknowledged_at'] = acknowledgedAt;
    }
    if (customHeaders != null) {
      json[r'custom_headers'] = customHeaders;
    }
    if (data != null) {
      json[r'data'] = data;
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (idempotencyKey != null) {
      json[r'idempotency_key'] = idempotencyKey;
    }
    return json;
  }

  ModelsBroadcastEvent copyWith({
    String? acknowledgedAt,
    Map<String, Object?>? customHeaders,
    Map<String, Object?>? data,
    String? eventType,
    String? idempotencyKey,
  }) {
    return ModelsBroadcastEvent(
      acknowledgedAt: acknowledgedAt ?? this.acknowledgedAt,
      customHeaders: customHeaders ?? this.customHeaders,
      data: data ?? this.data,
      eventType: eventType ?? this.eventType,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
    );
  }
}

class ModelsBulkUpdateFilterRequest {
  final Map<String, Object?>? body;
  final String? eventType;
  final Map<String, Object?>? headers;
  final String uid;

  ModelsBulkUpdateFilterRequest({
    this.body,
    this.eventType,
    this.headers,
    required this.uid,
  });

  factory ModelsBulkUpdateFilterRequest.fromJson(Map<String, Object?> json) {
    return ModelsBulkUpdateFilterRequest(
      body: json[r'body'] as Map<String, Object?>?,
      eventType: json[r'event_type'] as String?,
      headers: json[r'headers'] as Map<String, Object?>?,
      uid: json[r'uid'] as String? ?? '',
    );
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var eventType = this.eventType;
    var headers = this.headers;
    var uid = this.uid;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body;
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (headers != null) {
      json[r'headers'] = headers;
    }
    json[r'uid'] = uid;
    return json;
  }

  ModelsBulkUpdateFilterRequest copyWith({
    Map<String, Object?>? body,
    String? eventType,
    Map<String, Object?>? headers,
    String? uid,
  }) {
    return ModelsBulkUpdateFilterRequest(
      body: body ?? this.body,
      eventType: eventType ?? this.eventType,
      headers: headers ?? this.headers,
      uid: uid ?? this.uid,
    );
  }
}

class ModelsCreateEndpoint {
  /// Convoy supports two
  /// [signature formats](https://getconvoy.io/docs/product-manual/signatures)
  /// -- simple or advanced. If left unspecified, we default to false.
  final bool? advancedSignatures;

  /// Deprecated but necessary for backward compatibility
  final String? appId;

  /// This is used to define any custom authentication required by the endpoint.
  /// This
  /// shouldn't be needed often because webhook endpoints usually should be
  /// exposed to
  /// the internet.
  final ModelsEndpointAuthentication? authentication;

  /// Content type for the endpoint. Defaults to application/json if not
  /// specified.
  final String? contentType;

  /// Human-readable description of the endpoint. Think of this as metadata
  /// describing
  /// the endpoint
  final String? description;

  /// Define endpoint http timeout in seconds.
  final int? httpTimeout;

  /// This is used to manually enable/disable the endpoint.
  final bool? isDisabled;

  /// mTLS client certificate configuration for the endpoint
  final ModelsMtlsClientCert? mtlsClientCert;

  /// Endpoint name.
  final String? name;

  /// The OwnerID is used to group more than one endpoint together to achieve
  /// [fanout](https://getconvoy.io/docs/manual/endpoints#Endpoint%20Owner%20ID)
  final String? ownerId;

  /// Rate limit is the total number of requests to be sent to an endpoint in
  /// the time duration specified in RateLimitDuration
  final int? rateLimit;

  /// Rate limit duration specifies the time range for the rate limit.
  final int? rateLimitDuration;

  /// Endpoint's webhook secret. If not provided, Convoy autogenerates one for
  /// the endpoint.
  final String? secret;

  /// Slack webhook URL is an alternative method to support email where endpoint
  /// developers
  /// can receive failure notifications on a slack channel.
  final String? slackWebhookUrl;

  /// Endpoint developers support email. This is used for communicating endpoint
  /// state
  /// changes. You should always turn this on when disabling endpoints are
  /// enabled.
  final String? supportEmail;

  /// URL is the endpoint's URL prefixed with https. non-https urls are
  /// currently
  /// not supported.
  final String? url;

  ModelsCreateEndpoint({
    this.advancedSignatures,
    this.appId,
    this.authentication,
    this.contentType,
    this.description,
    this.httpTimeout,
    this.isDisabled,
    this.mtlsClientCert,
    this.name,
    this.ownerId,
    this.rateLimit,
    this.rateLimitDuration,
    this.secret,
    this.slackWebhookUrl,
    this.supportEmail,
    this.url,
  });

  factory ModelsCreateEndpoint.fromJson(Map<String, Object?> json) {
    return ModelsCreateEndpoint(
      advancedSignatures: json[r'advanced_signatures'] as bool?,
      appId: json[r'appID'] as String?,
      authentication: json[r'authentication'] != null
          ? ModelsEndpointAuthentication.fromJson(
              json[r'authentication']! as Map<String, Object?>,
            )
          : null,
      contentType: json[r'content_type'] as String?,
      description: json[r'description'] as String?,
      httpTimeout: (json[r'http_timeout'] as num?)?.toInt(),
      isDisabled: json[r'is_disabled'] as bool?,
      mtlsClientCert: json[r'mtls_client_cert'] != null
          ? ModelsMtlsClientCert.fromJson(
              json[r'mtls_client_cert']! as Map<String, Object?>,
            )
          : null,
      name: json[r'name'] as String?,
      ownerId: json[r'owner_id'] as String?,
      rateLimit: (json[r'rate_limit'] as num?)?.toInt(),
      rateLimitDuration: (json[r'rate_limit_duration'] as num?)?.toInt(),
      secret: json[r'secret'] as String?,
      slackWebhookUrl: json[r'slack_webhook_url'] as String?,
      supportEmail: json[r'support_email'] as String?,
      url: json[r'url'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var advancedSignatures = this.advancedSignatures;
    var appId = this.appId;
    var authentication = this.authentication;
    var contentType = this.contentType;
    var description = this.description;
    var httpTimeout = this.httpTimeout;
    var isDisabled = this.isDisabled;
    var mtlsClientCert = this.mtlsClientCert;
    var name = this.name;
    var ownerId = this.ownerId;
    var rateLimit = this.rateLimit;
    var rateLimitDuration = this.rateLimitDuration;
    var secret = this.secret;
    var slackWebhookUrl = this.slackWebhookUrl;
    var supportEmail = this.supportEmail;
    var url = this.url;

    final json = <String, Object?>{};
    if (advancedSignatures != null) {
      json[r'advanced_signatures'] = advancedSignatures;
    }
    if (appId != null) {
      json[r'appID'] = appId;
    }
    if (authentication != null) {
      json[r'authentication'] = authentication.toJson();
    }
    if (contentType != null) {
      json[r'content_type'] = contentType;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (httpTimeout != null) {
      json[r'http_timeout'] = httpTimeout;
    }
    if (isDisabled != null) {
      json[r'is_disabled'] = isDisabled;
    }
    if (mtlsClientCert != null) {
      json[r'mtls_client_cert'] = mtlsClientCert.toJson();
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (ownerId != null) {
      json[r'owner_id'] = ownerId;
    }
    if (rateLimit != null) {
      json[r'rate_limit'] = rateLimit;
    }
    if (rateLimitDuration != null) {
      json[r'rate_limit_duration'] = rateLimitDuration;
    }
    if (secret != null) {
      json[r'secret'] = secret;
    }
    if (slackWebhookUrl != null) {
      json[r'slack_webhook_url'] = slackWebhookUrl;
    }
    if (supportEmail != null) {
      json[r'support_email'] = supportEmail;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    return json;
  }

  ModelsCreateEndpoint copyWith({
    bool? advancedSignatures,
    String? appId,
    ModelsEndpointAuthentication? authentication,
    String? contentType,
    String? description,
    int? httpTimeout,
    bool? isDisabled,
    ModelsMtlsClientCert? mtlsClientCert,
    String? name,
    String? ownerId,
    int? rateLimit,
    int? rateLimitDuration,
    String? secret,
    String? slackWebhookUrl,
    String? supportEmail,
    String? url,
  }) {
    return ModelsCreateEndpoint(
      advancedSignatures: advancedSignatures ?? this.advancedSignatures,
      appId: appId ?? this.appId,
      authentication: authentication ?? this.authentication,
      contentType: contentType ?? this.contentType,
      description: description ?? this.description,
      httpTimeout: httpTimeout ?? this.httpTimeout,
      isDisabled: isDisabled ?? this.isDisabled,
      mtlsClientCert: mtlsClientCert ?? this.mtlsClientCert,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      rateLimit: rateLimit ?? this.rateLimit,
      rateLimitDuration: rateLimitDuration ?? this.rateLimitDuration,
      secret: secret ?? this.secret,
      slackWebhookUrl: slackWebhookUrl ?? this.slackWebhookUrl,
      supportEmail: supportEmail ?? this.supportEmail,
      url: url ?? this.url,
    );
  }
}

class ModelsCreateEvent {
  /// Deprecated but necessary for backward compatibility.
  final String? appId;

  /// Specifies custom headers you want convoy to add when the event is
  /// dispatched to your endpoint
  final Map<String, Object?>? customHeaders;

  /// Data is an arbitrary JSON value that gets sent as the body of the
  /// webhook to the endpoints
  final Map<String, Object?>? data;

  /// Specifies the endpoint to send this event to.
  final String? endpointId;

  /// Event Type is used for filtering and debugging e.g invoice.paid
  final String? eventType;

  /// Specify a key for event deduplication
  final String? idempotencyKey;

  ModelsCreateEvent({
    this.appId,
    this.customHeaders,
    this.data,
    this.endpointId,
    this.eventType,
    this.idempotencyKey,
  });

  factory ModelsCreateEvent.fromJson(Map<String, Object?> json) {
    return ModelsCreateEvent(
      appId: json[r'app_id'] as String?,
      customHeaders: json[r'custom_headers'] as Map<String, Object?>?,
      data: json[r'data'] as Map<String, Object?>?,
      endpointId: json[r'endpoint_id'] as String?,
      eventType: json[r'event_type'] as String?,
      idempotencyKey: json[r'idempotency_key'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var appId = this.appId;
    var customHeaders = this.customHeaders;
    var data = this.data;
    var endpointId = this.endpointId;
    var eventType = this.eventType;
    var idempotencyKey = this.idempotencyKey;

    final json = <String, Object?>{};
    if (appId != null) {
      json[r'app_id'] = appId;
    }
    if (customHeaders != null) {
      json[r'custom_headers'] = customHeaders;
    }
    if (data != null) {
      json[r'data'] = data;
    }
    if (endpointId != null) {
      json[r'endpoint_id'] = endpointId;
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (idempotencyKey != null) {
      json[r'idempotency_key'] = idempotencyKey;
    }
    return json;
  }

  ModelsCreateEvent copyWith({
    String? appId,
    Map<String, Object?>? customHeaders,
    Map<String, Object?>? data,
    String? endpointId,
    String? eventType,
    String? idempotencyKey,
  }) {
    return ModelsCreateEvent(
      appId: appId ?? this.appId,
      customHeaders: customHeaders ?? this.customHeaders,
      data: data ?? this.data,
      endpointId: endpointId ?? this.endpointId,
      eventType: eventType ?? this.eventType,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
    );
  }
}

class ModelsCreateEventType {
  /// Category is a product-specific grouping for the event type
  final String? category;

  /// Description is used to describe what the event type does
  final String? description;

  /// JSONSchema is the JSON structure of the event type
  final Map<String, Object?>? jsonSchema;

  /// Name is the event type name. E.g., invoice.created
  final String? name;

  ModelsCreateEventType({
    this.category,
    this.description,
    this.jsonSchema,
    this.name,
  });

  factory ModelsCreateEventType.fromJson(Map<String, Object?> json) {
    return ModelsCreateEventType(
      category: json[r'category'] as String?,
      description: json[r'description'] as String?,
      jsonSchema: json[r'json_schema'] as Map<String, Object?>?,
      name: json[r'name'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var category = this.category;
    var description = this.description;
    var jsonSchema = this.jsonSchema;
    var name = this.name;

    final json = <String, Object?>{};
    if (category != null) {
      json[r'category'] = category;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (jsonSchema != null) {
      json[r'json_schema'] = jsonSchema;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    return json;
  }

  ModelsCreateEventType copyWith({
    String? category,
    String? description,
    Map<String, Object?>? jsonSchema,
    String? name,
  }) {
    return ModelsCreateEventType(
      category: category ?? this.category,
      description: description ?? this.description,
      jsonSchema: jsonSchema ?? this.jsonSchema,
      name: name ?? this.name,
    );
  }
}

class ModelsCreateFilterRequest {
  /// Body matching criteria (optional)
  final DatastoreM? body;

  /// Type of event this filter applies to (required)
  final String eventType;

  /// Header matching criteria (optional)
  final DatastoreM? headers;

  ModelsCreateFilterRequest({this.body, required this.eventType, this.headers});

  factory ModelsCreateFilterRequest.fromJson(Map<String, Object?> json) {
    return ModelsCreateFilterRequest(
      body: json[r'body'] != null
          ? DatastoreM.fromJson(json[r'body']! as Map<String, Object?>)
          : null,
      eventType: json[r'event_type'] as String? ?? '',
      headers: json[r'headers'] != null
          ? DatastoreM.fromJson(json[r'headers']! as Map<String, Object?>)
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var eventType = this.eventType;
    var headers = this.headers;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body.toJson();
    }
    json[r'event_type'] = eventType;
    if (headers != null) {
      json[r'headers'] = headers.toJson();
    }
    return json;
  }

  ModelsCreateFilterRequest copyWith({
    DatastoreM? body,
    String? eventType,
    DatastoreM? headers,
  }) {
    return ModelsCreateFilterRequest(
      body: body ?? this.body,
      eventType: eventType ?? this.eventType,
      headers: headers ?? this.headers,
    );
  }
}

class ModelsCreateSource {
  /// Function is a javascript function used to mutate the payload
  /// immediately after ingesting an event
  final String? bodyFunction;

  /// Custom response is used to define a custom response for incoming
  /// webhooks project sources only.
  final ModelsCustomResponse? customResponse;

  /// Function is a javascript function used to mutate the headers
  /// immediately after ingesting an event
  final String? headerFunction;

  /// IdempotencyKeys are used to specify parts of a webhook request to uniquely
  /// identify the event in an incoming webhooks project.
  final List<String>? idempotencyKeys;

  /// Source name.
  final String? name;

  /// Use this to specify one of our predefined source types.
  final DatastoreSourceProvider? provider;

  /// PubSub are used to specify message broker sources for outgoing
  /// webhooks projects.
  final ModelsPubSubConfig? pubSub;

  /// Source Type.
  final DatastoreSourceType? type;

  /// Verifiers are used to verify webhook events ingested in incoming
  /// webhooks projects. If set, type is required and match the verifier
  /// type object you choose.
  final ModelsVerifierConfig? verifier;

  ModelsCreateSource({
    this.bodyFunction,
    this.customResponse,
    this.headerFunction,
    this.idempotencyKeys,
    this.name,
    this.provider,
    this.pubSub,
    this.type,
    this.verifier,
  });

  factory ModelsCreateSource.fromJson(Map<String, Object?> json) {
    return ModelsCreateSource(
      bodyFunction: json[r'body_function'] as String?,
      customResponse: json[r'custom_response'] != null
          ? ModelsCustomResponse.fromJson(
              json[r'custom_response']! as Map<String, Object?>,
            )
          : null,
      headerFunction: json[r'header_function'] as String?,
      idempotencyKeys: (json[r'idempotency_keys'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      name: json[r'name'] as String?,
      provider: json[r'provider'] != null
          ? DatastoreSourceProvider.fromValue(json[r'provider']! as String)
          : null,
      pubSub: json[r'pub_sub'] != null
          ? ModelsPubSubConfig.fromJson(
              json[r'pub_sub']! as Map<String, Object?>,
            )
          : null,
      type: json[r'type'] != null
          ? DatastoreSourceType.fromValue(json[r'type']! as String)
          : null,
      verifier: json[r'verifier'] != null
          ? ModelsVerifierConfig.fromJson(
              json[r'verifier']! as Map<String, Object?>,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var bodyFunction = this.bodyFunction;
    var customResponse = this.customResponse;
    var headerFunction = this.headerFunction;
    var idempotencyKeys = this.idempotencyKeys;
    var name = this.name;
    var provider = this.provider;
    var pubSub = this.pubSub;
    var type = this.type;
    var verifier = this.verifier;

    final json = <String, Object?>{};
    if (bodyFunction != null) {
      json[r'body_function'] = bodyFunction;
    }
    if (customResponse != null) {
      json[r'custom_response'] = customResponse.toJson();
    }
    if (headerFunction != null) {
      json[r'header_function'] = headerFunction;
    }
    if (idempotencyKeys != null) {
      json[r'idempotency_keys'] = idempotencyKeys;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (provider != null) {
      json[r'provider'] = provider.value;
    }
    if (pubSub != null) {
      json[r'pub_sub'] = pubSub.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    if (verifier != null) {
      json[r'verifier'] = verifier.toJson();
    }
    return json;
  }

  ModelsCreateSource copyWith({
    String? bodyFunction,
    ModelsCustomResponse? customResponse,
    String? headerFunction,
    List<String>? idempotencyKeys,
    String? name,
    DatastoreSourceProvider? provider,
    ModelsPubSubConfig? pubSub,
    DatastoreSourceType? type,
    ModelsVerifierConfig? verifier,
  }) {
    return ModelsCreateSource(
      bodyFunction: bodyFunction ?? this.bodyFunction,
      customResponse: customResponse ?? this.customResponse,
      headerFunction: headerFunction ?? this.headerFunction,
      idempotencyKeys: idempotencyKeys ?? this.idempotencyKeys,
      name: name ?? this.name,
      provider: provider ?? this.provider,
      pubSub: pubSub ?? this.pubSub,
      type: type ?? this.type,
      verifier: verifier ?? this.verifier,
    );
  }
}

class ModelsCreateSubscription {
  /// Alert configuration
  final ModelsAlertConfiguration? alertConfig;

  /// Deprecated but necessary for backward compatibility
  final String? appId;

  /// Delivery mode configuration
  final DatastoreDeliveryMode? deliveryMode;

  /// Destination endpoint ID
  final String? endpointId;

  /// Filter configuration
  final ModelsFilterConfiguration? filterConfig;

  /// Convoy supports mutating your request payload using a js function. Use
  /// this field
  /// to specify a `transform` function for this purpose. See
  /// this[https://docs.getconvoy.io/product-manual/subscriptions#functions] for
  /// more
  final String? function;

  /// Subscription Nme
  final String? name;

  /// Rate limit configuration
  final ModelsRateLimitConfiguration? rateLimitConfig;

  /// Source Id
  final String? sourceId;

  ModelsCreateSubscription({
    this.alertConfig,
    this.appId,
    this.deliveryMode,
    this.endpointId,
    this.filterConfig,
    this.function,
    this.name,
    this.rateLimitConfig,
    this.sourceId,
  });

  factory ModelsCreateSubscription.fromJson(Map<String, Object?> json) {
    return ModelsCreateSubscription(
      alertConfig: json[r'alert_config'] != null
          ? ModelsAlertConfiguration.fromJson(
              json[r'alert_config']! as Map<String, Object?>,
            )
          : null,
      appId: json[r'app_id'] as String?,
      deliveryMode: json[r'delivery_mode'] != null
          ? DatastoreDeliveryMode.fromValue(json[r'delivery_mode']! as String)
          : null,
      endpointId: json[r'endpoint_id'] as String?,
      filterConfig: json[r'filter_config'] != null
          ? ModelsFilterConfiguration.fromJson(
              json[r'filter_config']! as Map<String, Object?>,
            )
          : null,
      function: json[r'function'] as String?,
      name: json[r'name'] as String?,
      rateLimitConfig: json[r'rate_limit_config'] != null
          ? ModelsRateLimitConfiguration.fromJson(
              json[r'rate_limit_config']! as Map<String, Object?>,
            )
          : null,
      sourceId: json[r'source_id'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var alertConfig = this.alertConfig;
    var appId = this.appId;
    var deliveryMode = this.deliveryMode;
    var endpointId = this.endpointId;
    var filterConfig = this.filterConfig;
    var function = this.function;
    var name = this.name;
    var rateLimitConfig = this.rateLimitConfig;
    var sourceId = this.sourceId;

    final json = <String, Object?>{};
    if (alertConfig != null) {
      json[r'alert_config'] = alertConfig.toJson();
    }
    if (appId != null) {
      json[r'app_id'] = appId;
    }
    if (deliveryMode != null) {
      json[r'delivery_mode'] = deliveryMode.value;
    }
    if (endpointId != null) {
      json[r'endpoint_id'] = endpointId;
    }
    if (filterConfig != null) {
      json[r'filter_config'] = filterConfig.toJson();
    }
    if (function != null) {
      json[r'function'] = function;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (rateLimitConfig != null) {
      json[r'rate_limit_config'] = rateLimitConfig.toJson();
    }
    if (sourceId != null) {
      json[r'source_id'] = sourceId;
    }
    return json;
  }

  ModelsCreateSubscription copyWith({
    ModelsAlertConfiguration? alertConfig,
    String? appId,
    DatastoreDeliveryMode? deliveryMode,
    String? endpointId,
    ModelsFilterConfiguration? filterConfig,
    String? function,
    String? name,
    ModelsRateLimitConfiguration? rateLimitConfig,
    String? sourceId,
  }) {
    return ModelsCreateSubscription(
      alertConfig: alertConfig ?? this.alertConfig,
      appId: appId ?? this.appId,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      endpointId: endpointId ?? this.endpointId,
      filterConfig: filterConfig ?? this.filterConfig,
      function: function ?? this.function,
      name: name ?? this.name,
      rateLimitConfig: rateLimitConfig ?? this.rateLimitConfig,
      sourceId: sourceId ?? this.sourceId,
    );
  }
}

class ModelsCustomResponse {
  final String? body;
  final String? contentType;

  ModelsCustomResponse({this.body, this.contentType});

  factory ModelsCustomResponse.fromJson(Map<String, Object?> json) {
    return ModelsCustomResponse(
      body: json[r'body'] as String?,
      contentType: json[r'content_type'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var contentType = this.contentType;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body;
    }
    if (contentType != null) {
      json[r'content_type'] = contentType;
    }
    return json;
  }

  ModelsCustomResponse copyWith({String? body, String? contentType}) {
    return ModelsCustomResponse(
      body: body ?? this.body,
      contentType: contentType ?? this.contentType,
    );
  }
}

class ModelsDynamicEvent {
  /// Specifies custom headers you want convoy to add when the event is
  /// dispatched to your endpoint
  final Map<String, Object?>? customHeaders;

  /// Data is an arbitrary JSON value that gets sent as the body of the
  /// webhook to the endpoints
  final Map<String, Object?>? data;

  /// Event Type is used for filtering and debugging e.g invoice.paid
  final String? eventType;

  /// A list of event types for the subscription filter config
  final List<String>? eventTypes;

  /// Specify a key for event deduplication
  final String? idempotencyKey;

  /// Endpoint's webhook secret. If not provided, Convoy autogenerates one for
  /// the endpoint.
  final String? secret;

  /// URL is the endpoint's URL prefixed with https. non-https urls are
  /// currently
  /// not supported.
  final String? url;

  ModelsDynamicEvent({
    this.customHeaders,
    this.data,
    this.eventType,
    this.eventTypes,
    this.idempotencyKey,
    this.secret,
    this.url,
  });

  factory ModelsDynamicEvent.fromJson(Map<String, Object?> json) {
    return ModelsDynamicEvent(
      customHeaders: json[r'custom_headers'] as Map<String, Object?>?,
      data: json[r'data'] as Map<String, Object?>?,
      eventType: json[r'event_type'] as String?,
      eventTypes: (json[r'event_types'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      idempotencyKey: json[r'idempotency_key'] as String?,
      secret: json[r'secret'] as String?,
      url: json[r'url'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var customHeaders = this.customHeaders;
    var data = this.data;
    var eventType = this.eventType;
    var eventTypes = this.eventTypes;
    var idempotencyKey = this.idempotencyKey;
    var secret = this.secret;
    var url = this.url;

    final json = <String, Object?>{};
    if (customHeaders != null) {
      json[r'custom_headers'] = customHeaders;
    }
    if (data != null) {
      json[r'data'] = data;
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (eventTypes != null) {
      json[r'event_types'] = eventTypes;
    }
    if (idempotencyKey != null) {
      json[r'idempotency_key'] = idempotencyKey;
    }
    if (secret != null) {
      json[r'secret'] = secret;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    return json;
  }

  ModelsDynamicEvent copyWith({
    Map<String, Object?>? customHeaders,
    Map<String, Object?>? data,
    String? eventType,
    List<String>? eventTypes,
    String? idempotencyKey,
    String? secret,
    String? url,
  }) {
    return ModelsDynamicEvent(
      customHeaders: customHeaders ?? this.customHeaders,
      data: data ?? this.data,
      eventType: eventType ?? this.eventType,
      eventTypes: eventTypes ?? this.eventTypes,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      secret: secret ?? this.secret,
      url: url ?? this.url,
    );
  }
}

class ModelsEndpointAuthentication {
  final ModelsApiKey? apiKey;
  final ModelsBasicAuth? basicAuth;
  final ModelsOAuth2? oauth2;
  final DatastoreEndpointAuthenticationType? type;

  ModelsEndpointAuthentication({
    this.apiKey,
    this.basicAuth,
    this.oauth2,
    this.type,
  });

  factory ModelsEndpointAuthentication.fromJson(Map<String, Object?> json) {
    return ModelsEndpointAuthentication(
      apiKey: json[r'api_key'] != null
          ? ModelsApiKey.fromJson(json[r'api_key']! as Map<String, Object?>)
          : null,
      basicAuth: json[r'basic_auth'] != null
          ? ModelsBasicAuth.fromJson(
              json[r'basic_auth']! as Map<String, Object?>,
            )
          : null,
      oauth2: json[r'oauth2'] != null
          ? ModelsOAuth2.fromJson(json[r'oauth2']! as Map<String, Object?>)
          : null,
      type: json[r'type'] != null
          ? DatastoreEndpointAuthenticationType.fromValue(
              json[r'type']! as String,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var apiKey = this.apiKey;
    var basicAuth = this.basicAuth;
    var oauth2 = this.oauth2;
    var type = this.type;

    final json = <String, Object?>{};
    if (apiKey != null) {
      json[r'api_key'] = apiKey.toJson();
    }
    if (basicAuth != null) {
      json[r'basic_auth'] = basicAuth.toJson();
    }
    if (oauth2 != null) {
      json[r'oauth2'] = oauth2.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    return json;
  }

  ModelsEndpointAuthentication copyWith({
    ModelsApiKey? apiKey,
    ModelsBasicAuth? basicAuth,
    ModelsOAuth2? oauth2,
    DatastoreEndpointAuthenticationType? type,
  }) {
    return ModelsEndpointAuthentication(
      apiKey: apiKey ?? this.apiKey,
      basicAuth: basicAuth ?? this.basicAuth,
      oauth2: oauth2 ?? this.oauth2,
      type: type ?? this.type,
    );
  }
}

class ModelsEndpointResponse {
  final bool? advancedSignatures;
  final DatastoreEndpointAuthentication? authentication;
  final String? contentType;
  final String? createdAt;
  final String? deletedAt;
  final String? description;
  final int? events;
  final num? failureRate;
  final int? httpTimeout;

  /// mTLS client certificate configuration
  final DatastoreMtlsClientCert? mtlsClientCert;
  final String? name;
  final String? ownerId;
  final String? projectId;
  final int? rateLimit;
  final int? rateLimitDuration;
  final List<DatastoreSecret>? secrets;
  final String? slackWebhookUrl;
  final DatastoreEndpointStatus? status;
  final String? supportEmail;
  final String? uid;
  final String? updatedAt;
  final String? url;

  ModelsEndpointResponse({
    this.advancedSignatures,
    this.authentication,
    this.contentType,
    this.createdAt,
    this.deletedAt,
    this.description,
    this.events,
    this.failureRate,
    this.httpTimeout,
    this.mtlsClientCert,
    this.name,
    this.ownerId,
    this.projectId,
    this.rateLimit,
    this.rateLimitDuration,
    this.secrets,
    this.slackWebhookUrl,
    this.status,
    this.supportEmail,
    this.uid,
    this.updatedAt,
    this.url,
  });

  factory ModelsEndpointResponse.fromJson(Map<String, Object?> json) {
    return ModelsEndpointResponse(
      advancedSignatures: json[r'advanced_signatures'] as bool?,
      authentication: json[r'authentication'] != null
          ? DatastoreEndpointAuthentication.fromJson(
              json[r'authentication']! as Map<String, Object?>,
            )
          : null,
      contentType: json[r'content_type'] as String?,
      createdAt: json[r'created_at'] as String?,
      deletedAt: json[r'deleted_at'] as String?,
      description: json[r'description'] as String?,
      events: (json[r'events'] as num?)?.toInt(),
      failureRate: json[r'failure_rate'] as num?,
      httpTimeout: (json[r'http_timeout'] as num?)?.toInt(),
      mtlsClientCert: json[r'mtls_client_cert'] != null
          ? DatastoreMtlsClientCert.fromJson(
              json[r'mtls_client_cert']! as Map<String, Object?>,
            )
          : null,
      name: json[r'name'] as String?,
      ownerId: json[r'owner_id'] as String?,
      projectId: json[r'project_id'] as String?,
      rateLimit: (json[r'rate_limit'] as num?)?.toInt(),
      rateLimitDuration: (json[r'rate_limit_duration'] as num?)?.toInt(),
      secrets: (json[r'secrets'] as List<Object?>?)
          ?.map(
            (i) => DatastoreSecret.fromJson(
              i as Map<String, Object?>? ?? const {},
            ),
          )
          .toList(),
      slackWebhookUrl: json[r'slack_webhook_url'] as String?,
      status: json[r'status'] != null
          ? DatastoreEndpointStatus.fromValue(json[r'status']! as String)
          : null,
      supportEmail: json[r'support_email'] as String?,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      url: json[r'url'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var advancedSignatures = this.advancedSignatures;
    var authentication = this.authentication;
    var contentType = this.contentType;
    var createdAt = this.createdAt;
    var deletedAt = this.deletedAt;
    var description = this.description;
    var events = this.events;
    var failureRate = this.failureRate;
    var httpTimeout = this.httpTimeout;
    var mtlsClientCert = this.mtlsClientCert;
    var name = this.name;
    var ownerId = this.ownerId;
    var projectId = this.projectId;
    var rateLimit = this.rateLimit;
    var rateLimitDuration = this.rateLimitDuration;
    var secrets = this.secrets;
    var slackWebhookUrl = this.slackWebhookUrl;
    var status = this.status;
    var supportEmail = this.supportEmail;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var url = this.url;

    final json = <String, Object?>{};
    if (advancedSignatures != null) {
      json[r'advanced_signatures'] = advancedSignatures;
    }
    if (authentication != null) {
      json[r'authentication'] = authentication.toJson();
    }
    if (contentType != null) {
      json[r'content_type'] = contentType;
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (events != null) {
      json[r'events'] = events;
    }
    if (failureRate != null) {
      json[r'failure_rate'] = failureRate;
    }
    if (httpTimeout != null) {
      json[r'http_timeout'] = httpTimeout;
    }
    if (mtlsClientCert != null) {
      json[r'mtls_client_cert'] = mtlsClientCert.toJson();
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (ownerId != null) {
      json[r'owner_id'] = ownerId;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (rateLimit != null) {
      json[r'rate_limit'] = rateLimit;
    }
    if (rateLimitDuration != null) {
      json[r'rate_limit_duration'] = rateLimitDuration;
    }
    if (secrets != null) {
      json[r'secrets'] = secrets.map((i) => i.toJson()).toList();
    }
    if (slackWebhookUrl != null) {
      json[r'slack_webhook_url'] = slackWebhookUrl;
    }
    if (status != null) {
      json[r'status'] = status.value;
    }
    if (supportEmail != null) {
      json[r'support_email'] = supportEmail;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    return json;
  }

  ModelsEndpointResponse copyWith({
    bool? advancedSignatures,
    DatastoreEndpointAuthentication? authentication,
    String? contentType,
    String? createdAt,
    String? deletedAt,
    String? description,
    int? events,
    num? failureRate,
    int? httpTimeout,
    DatastoreMtlsClientCert? mtlsClientCert,
    String? name,
    String? ownerId,
    String? projectId,
    int? rateLimit,
    int? rateLimitDuration,
    List<DatastoreSecret>? secrets,
    String? slackWebhookUrl,
    DatastoreEndpointStatus? status,
    String? supportEmail,
    String? uid,
    String? updatedAt,
    String? url,
  }) {
    return ModelsEndpointResponse(
      advancedSignatures: advancedSignatures ?? this.advancedSignatures,
      authentication: authentication ?? this.authentication,
      contentType: contentType ?? this.contentType,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      description: description ?? this.description,
      events: events ?? this.events,
      failureRate: failureRate ?? this.failureRate,
      httpTimeout: httpTimeout ?? this.httpTimeout,
      mtlsClientCert: mtlsClientCert ?? this.mtlsClientCert,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      projectId: projectId ?? this.projectId,
      rateLimit: rateLimit ?? this.rateLimit,
      rateLimitDuration: rateLimitDuration ?? this.rateLimitDuration,
      secrets: secrets ?? this.secrets,
      slackWebhookUrl: slackWebhookUrl ?? this.slackWebhookUrl,
      status: status ?? this.status,
      supportEmail: supportEmail ?? this.supportEmail,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
    );
  }
}

class ModelsEventDeliveryResponse {
  final String? acknowledgedAt;
  final DatastoreCLIMetadata? cliMetadata;
  final String? createdAt;
  final String? deletedAt;
  final DatastoreDeliveryMode? deliveryMode;
  final String? description;
  final String? deviceId;
  final DatastoreDevice? deviceMetadata;
  final String? endpointId;
  final DatastoreEndpoint? endpointMetadata;
  final String? eventId;
  final DatastoreEvent? eventMetadata;
  final String? eventType;
  final HttpheaderHTTPHeader? headers;
  final String? idempotencyKey;

  /// Deprecated: Latency is deprecated.
  final String? latency;
  final num? latencySeconds;
  final DatastoreMetadata? metadata;
  final String? projectId;
  final DatastoreSource? sourceMetadata;
  final DatastoreEventDeliveryStatus? status;
  final String? subscriptionId;
  final String? uid;
  final String? updatedAt;
  final String? urlQueryParams;

  ModelsEventDeliveryResponse({
    this.acknowledgedAt,
    this.cliMetadata,
    this.createdAt,
    this.deletedAt,
    this.deliveryMode,
    this.description,
    this.deviceId,
    this.deviceMetadata,
    this.endpointId,
    this.endpointMetadata,
    this.eventId,
    this.eventMetadata,
    this.eventType,
    this.headers,
    this.idempotencyKey,
    this.latency,
    this.latencySeconds,
    this.metadata,
    this.projectId,
    this.sourceMetadata,
    this.status,
    this.subscriptionId,
    this.uid,
    this.updatedAt,
    this.urlQueryParams,
  });

  factory ModelsEventDeliveryResponse.fromJson(Map<String, Object?> json) {
    return ModelsEventDeliveryResponse(
      acknowledgedAt: json[r'acknowledged_at'] as String?,
      cliMetadata: json[r'cli_metadata'] != null
          ? DatastoreCLIMetadata.fromJson(
              json[r'cli_metadata']! as Map<String, Object?>,
            )
          : null,
      createdAt: json[r'created_at'] as String?,
      deletedAt: json[r'deleted_at'] as String?,
      deliveryMode: json[r'delivery_mode'] != null
          ? DatastoreDeliveryMode.fromValue(json[r'delivery_mode']! as String)
          : null,
      description: json[r'description'] as String?,
      deviceId: json[r'device_id'] as String?,
      deviceMetadata: json[r'device_metadata'] != null
          ? DatastoreDevice.fromJson(
              json[r'device_metadata']! as Map<String, Object?>,
            )
          : null,
      endpointId: json[r'endpoint_id'] as String?,
      endpointMetadata: json[r'endpoint_metadata'] != null
          ? DatastoreEndpoint.fromJson(
              json[r'endpoint_metadata']! as Map<String, Object?>,
            )
          : null,
      eventId: json[r'event_id'] as String?,
      eventMetadata: json[r'event_metadata'] != null
          ? DatastoreEvent.fromJson(
              json[r'event_metadata']! as Map<String, Object?>,
            )
          : null,
      eventType: json[r'event_type'] as String?,
      headers: json[r'headers'] != null
          ? HttpheaderHTTPHeader.fromJson(
              json[r'headers']! as Map<String, Object?>,
            )
          : null,
      idempotencyKey: json[r'idempotency_key'] as String?,
      latency: json[r'latency'] as String?,
      latencySeconds: json[r'latency_seconds'] as num?,
      metadata: json[r'metadata'] != null
          ? DatastoreMetadata.fromJson(
              json[r'metadata']! as Map<String, Object?>,
            )
          : null,
      projectId: json[r'project_id'] as String?,
      sourceMetadata: json[r'source_metadata'] != null
          ? DatastoreSource.fromJson(
              json[r'source_metadata']! as Map<String, Object?>,
            )
          : null,
      status: json[r'status'] != null
          ? DatastoreEventDeliveryStatus.fromValue(json[r'status']! as String)
          : null,
      subscriptionId: json[r'subscription_id'] as String?,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      urlQueryParams: json[r'url_query_params'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var acknowledgedAt = this.acknowledgedAt;
    var cliMetadata = this.cliMetadata;
    var createdAt = this.createdAt;
    var deletedAt = this.deletedAt;
    var deliveryMode = this.deliveryMode;
    var description = this.description;
    var deviceId = this.deviceId;
    var deviceMetadata = this.deviceMetadata;
    var endpointId = this.endpointId;
    var endpointMetadata = this.endpointMetadata;
    var eventId = this.eventId;
    var eventMetadata = this.eventMetadata;
    var eventType = this.eventType;
    var headers = this.headers;
    var idempotencyKey = this.idempotencyKey;
    var latency = this.latency;
    var latencySeconds = this.latencySeconds;
    var metadata = this.metadata;
    var projectId = this.projectId;
    var sourceMetadata = this.sourceMetadata;
    var status = this.status;
    var subscriptionId = this.subscriptionId;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var urlQueryParams = this.urlQueryParams;

    final json = <String, Object?>{};
    if (acknowledgedAt != null) {
      json[r'acknowledged_at'] = acknowledgedAt;
    }
    if (cliMetadata != null) {
      json[r'cli_metadata'] = cliMetadata.toJson();
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (deliveryMode != null) {
      json[r'delivery_mode'] = deliveryMode.value;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (deviceId != null) {
      json[r'device_id'] = deviceId;
    }
    if (deviceMetadata != null) {
      json[r'device_metadata'] = deviceMetadata.toJson();
    }
    if (endpointId != null) {
      json[r'endpoint_id'] = endpointId;
    }
    if (endpointMetadata != null) {
      json[r'endpoint_metadata'] = endpointMetadata.toJson();
    }
    if (eventId != null) {
      json[r'event_id'] = eventId;
    }
    if (eventMetadata != null) {
      json[r'event_metadata'] = eventMetadata.toJson();
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (headers != null) {
      json[r'headers'] = headers.toJson();
    }
    if (idempotencyKey != null) {
      json[r'idempotency_key'] = idempotencyKey;
    }
    if (latency != null) {
      json[r'latency'] = latency;
    }
    if (latencySeconds != null) {
      json[r'latency_seconds'] = latencySeconds;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata.toJson();
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (sourceMetadata != null) {
      json[r'source_metadata'] = sourceMetadata.toJson();
    }
    if (status != null) {
      json[r'status'] = status.value;
    }
    if (subscriptionId != null) {
      json[r'subscription_id'] = subscriptionId;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (urlQueryParams != null) {
      json[r'url_query_params'] = urlQueryParams;
    }
    return json;
  }

  ModelsEventDeliveryResponse copyWith({
    String? acknowledgedAt,
    DatastoreCLIMetadata? cliMetadata,
    String? createdAt,
    String? deletedAt,
    DatastoreDeliveryMode? deliveryMode,
    String? description,
    String? deviceId,
    DatastoreDevice? deviceMetadata,
    String? endpointId,
    DatastoreEndpoint? endpointMetadata,
    String? eventId,
    DatastoreEvent? eventMetadata,
    String? eventType,
    HttpheaderHTTPHeader? headers,
    String? idempotencyKey,
    String? latency,
    num? latencySeconds,
    DatastoreMetadata? metadata,
    String? projectId,
    DatastoreSource? sourceMetadata,
    DatastoreEventDeliveryStatus? status,
    String? subscriptionId,
    String? uid,
    String? updatedAt,
    String? urlQueryParams,
  }) {
    return ModelsEventDeliveryResponse(
      acknowledgedAt: acknowledgedAt ?? this.acknowledgedAt,
      cliMetadata: cliMetadata ?? this.cliMetadata,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      description: description ?? this.description,
      deviceId: deviceId ?? this.deviceId,
      deviceMetadata: deviceMetadata ?? this.deviceMetadata,
      endpointId: endpointId ?? this.endpointId,
      endpointMetadata: endpointMetadata ?? this.endpointMetadata,
      eventId: eventId ?? this.eventId,
      eventMetadata: eventMetadata ?? this.eventMetadata,
      eventType: eventType ?? this.eventType,
      headers: headers ?? this.headers,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      latency: latency ?? this.latency,
      latencySeconds: latencySeconds ?? this.latencySeconds,
      metadata: metadata ?? this.metadata,
      projectId: projectId ?? this.projectId,
      sourceMetadata: sourceMetadata ?? this.sourceMetadata,
      status: status ?? this.status,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      urlQueryParams: urlQueryParams ?? this.urlQueryParams,
    );
  }
}

class ModelsEventResponse {
  final String? acknowledgedAt;

  /// Deprecated
  final String? appId;
  final String? createdAt;

  /// Data is an arbitrary JSON value that gets sent as the body of the
  /// webhook to the endpoints
  final List<int>? data;
  final String? deletedAt;
  final List<DatastoreEndpoint>? endpointMetadata;
  final List<String>? endpoints;
  final String? eventType;
  final HttpheaderHTTPHeader? headers;
  final String? idempotencyKey;
  final bool? isDuplicateEvent;
  final String? metadata;
  final String? projectId;
  final String? raw;
  final String? sourceId;
  final DatastoreSource? sourceMetadata;
  final DatastoreEventStatus? status;
  final String? uid;
  final String? updatedAt;
  final String? urlQueryParams;

  ModelsEventResponse({
    this.acknowledgedAt,
    this.appId,
    this.createdAt,
    this.data,
    this.deletedAt,
    this.endpointMetadata,
    this.endpoints,
    this.eventType,
    this.headers,
    this.idempotencyKey,
    this.isDuplicateEvent,
    this.metadata,
    this.projectId,
    this.raw,
    this.sourceId,
    this.sourceMetadata,
    this.status,
    this.uid,
    this.updatedAt,
    this.urlQueryParams,
  });

  factory ModelsEventResponse.fromJson(Map<String, Object?> json) {
    return ModelsEventResponse(
      acknowledgedAt: json[r'acknowledged_at'] as String?,
      appId: json[r'app_id'] as String?,
      createdAt: json[r'created_at'] as String?,
      data: (json[r'data'] as List<Object?>?)
          ?.map((i) => (i as num?)?.toInt() ?? 0)
          .toList(),
      deletedAt: json[r'deleted_at'] as String?,
      endpointMetadata: (json[r'endpoint_metadata'] as List<Object?>?)
          ?.map(
            (i) => DatastoreEndpoint.fromJson(
              i as Map<String, Object?>? ?? const {},
            ),
          )
          .toList(),
      endpoints: (json[r'endpoints'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      eventType: json[r'event_type'] as String?,
      headers: json[r'headers'] != null
          ? HttpheaderHTTPHeader.fromJson(
              json[r'headers']! as Map<String, Object?>,
            )
          : null,
      idempotencyKey: json[r'idempotency_key'] as String?,
      isDuplicateEvent: json[r'is_duplicate_event'] as bool?,
      metadata: json[r'metadata'] as String?,
      projectId: json[r'project_id'] as String?,
      raw: json[r'raw'] as String?,
      sourceId: json[r'source_id'] as String?,
      sourceMetadata: json[r'source_metadata'] != null
          ? DatastoreSource.fromJson(
              json[r'source_metadata']! as Map<String, Object?>,
            )
          : null,
      status: json[r'status'] != null
          ? DatastoreEventStatus.fromValue(json[r'status']! as String)
          : null,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      urlQueryParams: json[r'url_query_params'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var acknowledgedAt = this.acknowledgedAt;
    var appId = this.appId;
    var createdAt = this.createdAt;
    var data = this.data;
    var deletedAt = this.deletedAt;
    var endpointMetadata = this.endpointMetadata;
    var endpoints = this.endpoints;
    var eventType = this.eventType;
    var headers = this.headers;
    var idempotencyKey = this.idempotencyKey;
    var isDuplicateEvent = this.isDuplicateEvent;
    var metadata = this.metadata;
    var projectId = this.projectId;
    var raw = this.raw;
    var sourceId = this.sourceId;
    var sourceMetadata = this.sourceMetadata;
    var status = this.status;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var urlQueryParams = this.urlQueryParams;

    final json = <String, Object?>{};
    if (acknowledgedAt != null) {
      json[r'acknowledged_at'] = acknowledgedAt;
    }
    if (appId != null) {
      json[r'app_id'] = appId;
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (data != null) {
      json[r'data'] = data;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (endpointMetadata != null) {
      json[r'endpoint_metadata'] = endpointMetadata
          .map((i) => i.toJson())
          .toList();
    }
    if (endpoints != null) {
      json[r'endpoints'] = endpoints;
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (headers != null) {
      json[r'headers'] = headers.toJson();
    }
    if (idempotencyKey != null) {
      json[r'idempotency_key'] = idempotencyKey;
    }
    if (isDuplicateEvent != null) {
      json[r'is_duplicate_event'] = isDuplicateEvent;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (raw != null) {
      json[r'raw'] = raw;
    }
    if (sourceId != null) {
      json[r'source_id'] = sourceId;
    }
    if (sourceMetadata != null) {
      json[r'source_metadata'] = sourceMetadata.toJson();
    }
    if (status != null) {
      json[r'status'] = status.value;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (urlQueryParams != null) {
      json[r'url_query_params'] = urlQueryParams;
    }
    return json;
  }

  ModelsEventResponse copyWith({
    String? acknowledgedAt,
    String? appId,
    String? createdAt,
    List<int>? data,
    String? deletedAt,
    List<DatastoreEndpoint>? endpointMetadata,
    List<String>? endpoints,
    String? eventType,
    HttpheaderHTTPHeader? headers,
    String? idempotencyKey,
    bool? isDuplicateEvent,
    String? metadata,
    String? projectId,
    String? raw,
    String? sourceId,
    DatastoreSource? sourceMetadata,
    DatastoreEventStatus? status,
    String? uid,
    String? updatedAt,
    String? urlQueryParams,
  }) {
    return ModelsEventResponse(
      acknowledgedAt: acknowledgedAt ?? this.acknowledgedAt,
      appId: appId ?? this.appId,
      createdAt: createdAt ?? this.createdAt,
      data: data ?? this.data,
      deletedAt: deletedAt ?? this.deletedAt,
      endpointMetadata: endpointMetadata ?? this.endpointMetadata,
      endpoints: endpoints ?? this.endpoints,
      eventType: eventType ?? this.eventType,
      headers: headers ?? this.headers,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      isDuplicateEvent: isDuplicateEvent ?? this.isDuplicateEvent,
      metadata: metadata ?? this.metadata,
      projectId: projectId ?? this.projectId,
      raw: raw ?? this.raw,
      sourceId: sourceId ?? this.sourceId,
      sourceMetadata: sourceMetadata ?? this.sourceMetadata,
      status: status ?? this.status,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      urlQueryParams: urlQueryParams ?? this.urlQueryParams,
    );
  }
}

class ModelsEventTypeResponse {
  final String? category;
  final String? deprecatedAt;
  final String? description;
  final List<int>? jsonSchema;
  final String? name;
  final String? uid;

  ModelsEventTypeResponse({
    this.category,
    this.deprecatedAt,
    this.description,
    this.jsonSchema,
    this.name,
    this.uid,
  });

  factory ModelsEventTypeResponse.fromJson(Map<String, Object?> json) {
    return ModelsEventTypeResponse(
      category: json[r'category'] as String?,
      deprecatedAt: json[r'deprecated_at'] as String?,
      description: json[r'description'] as String?,
      jsonSchema: (json[r'json_schema'] as List<Object?>?)
          ?.map((i) => (i as num?)?.toInt() ?? 0)
          .toList(),
      name: json[r'name'] as String?,
      uid: json[r'uid'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var category = this.category;
    var deprecatedAt = this.deprecatedAt;
    var description = this.description;
    var jsonSchema = this.jsonSchema;
    var name = this.name;
    var uid = this.uid;

    final json = <String, Object?>{};
    if (category != null) {
      json[r'category'] = category;
    }
    if (deprecatedAt != null) {
      json[r'deprecated_at'] = deprecatedAt;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (jsonSchema != null) {
      json[r'json_schema'] = jsonSchema;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    return json;
  }

  ModelsEventTypeResponse copyWith({
    String? category,
    String? deprecatedAt,
    String? description,
    List<int>? jsonSchema,
    String? name,
    String? uid,
  }) {
    return ModelsEventTypeResponse(
      category: category ?? this.category,
      deprecatedAt: deprecatedAt ?? this.deprecatedAt,
      description: description ?? this.description,
      jsonSchema: jsonSchema ?? this.jsonSchema,
      name: name ?? this.name,
      uid: uid ?? this.uid,
    );
  }
}

class ModelsExpireSecret {
  /// Amount of time to wait before expiring the old endpoint secret.
  /// If AdvancedSignatures is turned on for the project, signatures for both
  /// secrets will be generated up until
  /// the old signature is expired.
  final int? expiration;

  /// New Endpoint secret value.
  final String? secret;

  ModelsExpireSecret({this.expiration, this.secret});

  factory ModelsExpireSecret.fromJson(Map<String, Object?> json) {
    return ModelsExpireSecret(
      expiration: (json[r'expiration'] as num?)?.toInt(),
      secret: json[r'secret'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var expiration = this.expiration;
    var secret = this.secret;

    final json = <String, Object?>{};
    if (expiration != null) {
      json[r'expiration'] = expiration;
    }
    if (secret != null) {
      json[r'secret'] = secret;
    }
    return json;
  }

  ModelsExpireSecret copyWith({int? expiration, String? secret}) {
    return ModelsExpireSecret(
      expiration: expiration ?? this.expiration,
      secret: secret ?? this.secret,
    );
  }
}

class ModelsFS {
  final DatastoreM? body;
  final DatastoreM? headers;

  ModelsFS({this.body, this.headers});

  factory ModelsFS.fromJson(Map<String, Object?> json) {
    return ModelsFS(
      body: json[r'body'] != null
          ? DatastoreM.fromJson(json[r'body']! as Map<String, Object?>)
          : null,
      headers: json[r'headers'] != null
          ? DatastoreM.fromJson(json[r'headers']! as Map<String, Object?>)
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var headers = this.headers;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body.toJson();
    }
    if (headers != null) {
      json[r'headers'] = headers.toJson();
    }
    return json;
  }

  ModelsFS copyWith({DatastoreM? body, DatastoreM? headers}) {
    return ModelsFS(body: body ?? this.body, headers: headers ?? this.headers);
  }
}

class ModelsFanoutEvent {
  /// Specifies custom headers you want convoy to add when the event is
  /// dispatched to your endpoint
  final Map<String, Object?>? customHeaders;

  /// Data is an arbitrary JSON value that gets sent as the body of the
  /// webhook to the endpoints
  final Map<String, Object?>? data;

  /// Event Type is used for filtering and debugging e.g invoice.paid
  final String? eventType;

  /// Specify a key for event deduplication
  final String? idempotencyKey;

  /// Used for fanout, sends this event to all endpoints with this OwnerID.
  final String? ownerId;

  ModelsFanoutEvent({
    this.customHeaders,
    this.data,
    this.eventType,
    this.idempotencyKey,
    this.ownerId,
  });

  factory ModelsFanoutEvent.fromJson(Map<String, Object?> json) {
    return ModelsFanoutEvent(
      customHeaders: json[r'custom_headers'] as Map<String, Object?>?,
      data: json[r'data'] as Map<String, Object?>?,
      eventType: json[r'event_type'] as String?,
      idempotencyKey: json[r'idempotency_key'] as String?,
      ownerId: json[r'owner_id'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var customHeaders = this.customHeaders;
    var data = this.data;
    var eventType = this.eventType;
    var idempotencyKey = this.idempotencyKey;
    var ownerId = this.ownerId;

    final json = <String, Object?>{};
    if (customHeaders != null) {
      json[r'custom_headers'] = customHeaders;
    }
    if (data != null) {
      json[r'data'] = data;
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (idempotencyKey != null) {
      json[r'idempotency_key'] = idempotencyKey;
    }
    if (ownerId != null) {
      json[r'owner_id'] = ownerId;
    }
    return json;
  }

  ModelsFanoutEvent copyWith({
    Map<String, Object?>? customHeaders,
    Map<String, Object?>? data,
    String? eventType,
    String? idempotencyKey,
    String? ownerId,
  }) {
    return ModelsFanoutEvent(
      customHeaders: customHeaders ?? this.customHeaders,
      data: data ?? this.data,
      eventType: eventType ?? this.eventType,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      ownerId: ownerId ?? this.ownerId,
    );
  }
}

class ModelsFilterConfiguration {
  /// List of event types that the subscription should match
  final List<String>? eventTypes;

  /// Body & Header filters
  final ModelsFS? filter;

  ModelsFilterConfiguration({this.eventTypes, this.filter});

  factory ModelsFilterConfiguration.fromJson(Map<String, Object?> json) {
    return ModelsFilterConfiguration(
      eventTypes: (json[r'event_types'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      filter: json[r'filter'] != null
          ? ModelsFS.fromJson(json[r'filter']! as Map<String, Object?>)
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var eventTypes = this.eventTypes;
    var filter = this.filter;

    final json = <String, Object?>{};
    if (eventTypes != null) {
      json[r'event_types'] = eventTypes;
    }
    if (filter != null) {
      json[r'filter'] = filter.toJson();
    }
    return json;
  }

  ModelsFilterConfiguration copyWith({
    List<String>? eventTypes,
    ModelsFS? filter,
  }) {
    return ModelsFilterConfiguration(
      eventTypes: eventTypes ?? this.eventTypes,
      filter: filter ?? this.filter,
    );
  }
}

class ModelsFilterResponse {
  final DatastoreM? body;
  final String? eventType;
  final DatastoreM? headers;
  final DatastoreM? rawBody;
  final DatastoreM? rawHeaders;
  final String? subscriptionId;
  final String? uid;

  ModelsFilterResponse({
    this.body,
    this.eventType,
    this.headers,
    this.rawBody,
    this.rawHeaders,
    this.subscriptionId,
    this.uid,
  });

  factory ModelsFilterResponse.fromJson(Map<String, Object?> json) {
    return ModelsFilterResponse(
      body: json[r'body'] != null
          ? DatastoreM.fromJson(json[r'body']! as Map<String, Object?>)
          : null,
      eventType: json[r'event_type'] as String?,
      headers: json[r'headers'] != null
          ? DatastoreM.fromJson(json[r'headers']! as Map<String, Object?>)
          : null,
      rawBody: json[r'raw_body'] != null
          ? DatastoreM.fromJson(json[r'raw_body']! as Map<String, Object?>)
          : null,
      rawHeaders: json[r'raw_headers'] != null
          ? DatastoreM.fromJson(json[r'raw_headers']! as Map<String, Object?>)
          : null,
      subscriptionId: json[r'subscription_id'] as String?,
      uid: json[r'uid'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var eventType = this.eventType;
    var headers = this.headers;
    var rawBody = this.rawBody;
    var rawHeaders = this.rawHeaders;
    var subscriptionId = this.subscriptionId;
    var uid = this.uid;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body.toJson();
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (headers != null) {
      json[r'headers'] = headers.toJson();
    }
    if (rawBody != null) {
      json[r'raw_body'] = rawBody.toJson();
    }
    if (rawHeaders != null) {
      json[r'raw_headers'] = rawHeaders.toJson();
    }
    if (subscriptionId != null) {
      json[r'subscription_id'] = subscriptionId;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    return json;
  }

  ModelsFilterResponse copyWith({
    DatastoreM? body,
    String? eventType,
    DatastoreM? headers,
    DatastoreM? rawBody,
    DatastoreM? rawHeaders,
    String? subscriptionId,
    String? uid,
  }) {
    return ModelsFilterResponse(
      body: body ?? this.body,
      eventType: eventType ?? this.eventType,
      headers: headers ?? this.headers,
      rawBody: rawBody ?? this.rawBody,
      rawHeaders: rawHeaders ?? this.rawHeaders,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      uid: uid ?? this.uid,
    );
  }
}

class ModelsFilterSchema {
  final Object? body;
  final Object? header;

  ModelsFilterSchema({this.body, this.header});

  factory ModelsFilterSchema.fromJson(Map<String, Object?> json) {
    return ModelsFilterSchema(body: json[r'body'], header: json[r'header']);
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var header = this.header;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body;
    }
    if (header != null) {
      json[r'header'] = header;
    }
    return json;
  }

  ModelsFilterSchema copyWith({Object? body, Object? header}) {
    return ModelsFilterSchema(
      body: body ?? this.body,
      header: header ?? this.header,
    );
  }
}

class ModelsFunctionRequest {
  final String? function;
  final Map<String, Object?>? payload;
  final String? type;

  ModelsFunctionRequest({this.function, this.payload, this.type});

  factory ModelsFunctionRequest.fromJson(Map<String, Object?> json) {
    return ModelsFunctionRequest(
      function: json[r'function'] as String?,
      payload: json[r'payload'] as Map<String, Object?>?,
      type: json[r'type'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var function = this.function;
    var payload = this.payload;
    var type = this.type;

    final json = <String, Object?>{};
    if (function != null) {
      json[r'function'] = function;
    }
    if (payload != null) {
      json[r'payload'] = payload;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    return json;
  }

  ModelsFunctionRequest copyWith({
    String? function,
    Map<String, Object?>? payload,
    String? type,
  }) {
    return ModelsFunctionRequest(
      function: function ?? this.function,
      payload: payload ?? this.payload,
      type: type ?? this.type,
    );
  }
}

class ModelsFunctionResponse {
  final List<String>? log;
  final Object? payload;

  ModelsFunctionResponse({this.log, this.payload});

  factory ModelsFunctionResponse.fromJson(Map<String, Object?> json) {
    return ModelsFunctionResponse(
      log: (json[r'log'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      payload: json[r'payload'],
    );
  }

  Map<String, Object?> toJson() {
    var log = this.log;
    var payload = this.payload;

    final json = <String, Object?>{};
    if (log != null) {
      json[r'log'] = log;
    }
    if (payload != null) {
      json[r'payload'] = payload;
    }
    return json;
  }

  ModelsFunctionResponse copyWith({List<String>? log, Object? payload}) {
    return ModelsFunctionResponse(
      log: log ?? this.log,
      payload: payload ?? this.payload,
    );
  }
}

class ModelsGooglePubSubConfig {
  final String? projectId;
  final List<int>? serviceAccount;
  final String? subscriptionId;

  ModelsGooglePubSubConfig({
    this.projectId,
    this.serviceAccount,
    this.subscriptionId,
  });

  factory ModelsGooglePubSubConfig.fromJson(Map<String, Object?> json) {
    return ModelsGooglePubSubConfig(
      projectId: json[r'project_id'] as String?,
      serviceAccount: (json[r'service_account'] as List<Object?>?)
          ?.map((i) => (i as num?)?.toInt() ?? 0)
          .toList(),
      subscriptionId: json[r'subscription_id'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var projectId = this.projectId;
    var serviceAccount = this.serviceAccount;
    var subscriptionId = this.subscriptionId;

    final json = <String, Object?>{};
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (serviceAccount != null) {
      json[r'service_account'] = serviceAccount;
    }
    if (subscriptionId != null) {
      json[r'subscription_id'] = subscriptionId;
    }
    return json;
  }

  ModelsGooglePubSubConfig copyWith({
    String? projectId,
    List<int>? serviceAccount,
    String? subscriptionId,
  }) {
    return ModelsGooglePubSubConfig(
      projectId: projectId ?? this.projectId,
      serviceAccount: serviceAccount ?? this.serviceAccount,
      subscriptionId: subscriptionId ?? this.subscriptionId,
    );
  }
}

class ModelsHMac {
  final DatastoreEncodingType encoding;
  final String hash;
  final String header;
  final String secret;

  ModelsHMac({
    required this.encoding,
    required this.hash,
    required this.header,
    required this.secret,
  });

  factory ModelsHMac.fromJson(Map<String, Object?> json) {
    return ModelsHMac(
      encoding: DatastoreEncodingType.fromValue(
        json[r'encoding'] as String? ?? '',
      ),
      hash: json[r'hash'] as String? ?? '',
      header: json[r'header'] as String? ?? '',
      secret: json[r'secret'] as String? ?? '',
    );
  }

  Map<String, Object?> toJson() {
    var encoding = this.encoding;
    var hash = this.hash;
    var header = this.header;
    var secret = this.secret;

    final json = <String, Object?>{};
    json[r'encoding'] = encoding.value;
    json[r'hash'] = hash;
    json[r'header'] = header;
    json[r'secret'] = secret;
    return json;
  }

  ModelsHMac copyWith({
    DatastoreEncodingType? encoding,
    String? hash,
    String? header,
    String? secret,
  }) {
    return ModelsHMac(
      encoding: encoding ?? this.encoding,
      hash: hash ?? this.hash,
      header: header ?? this.header,
      secret: secret ?? this.secret,
    );
  }
}

class ModelsIDs {
  /// A list of event delivery IDs to forcefully resend.
  final List<String>? ids;

  ModelsIDs({this.ids});

  factory ModelsIDs.fromJson(Map<String, Object?> json) {
    return ModelsIDs(
      ids: (json[r'ids'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
    );
  }

  Map<String, Object?> toJson() {
    var ids = this.ids;

    final json = <String, Object?>{};
    if (ids != null) {
      json[r'ids'] = ids;
    }
    return json;
  }

  ModelsIDs copyWith({List<String>? ids}) {
    return ModelsIDs(ids: ids ?? this.ids);
  }
}

class ModelsImportOpenAPISpec {
  final String? spec;

  ModelsImportOpenAPISpec({this.spec});

  factory ModelsImportOpenAPISpec.fromJson(Map<String, Object?> json) {
    return ModelsImportOpenAPISpec(spec: json[r'spec'] as String?);
  }

  Map<String, Object?> toJson() {
    var spec = this.spec;

    final json = <String, Object?>{};
    if (spec != null) {
      json[r'spec'] = spec;
    }
    return json;
  }

  ModelsImportOpenAPISpec copyWith({String? spec}) {
    return ModelsImportOpenAPISpec(spec: spec ?? this.spec);
  }
}

class ModelsKafkaAuth {
  final String? hash;
  final String? password;
  final bool? tls;
  final String? type;
  final String? username;

  ModelsKafkaAuth({
    this.hash,
    this.password,
    this.tls,
    this.type,
    this.username,
  });

  factory ModelsKafkaAuth.fromJson(Map<String, Object?> json) {
    return ModelsKafkaAuth(
      hash: json[r'hash'] as String?,
      password: json[r'password'] as String?,
      tls: json[r'tls'] as bool?,
      type: json[r'type'] as String?,
      username: json[r'username'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var hash = this.hash;
    var password = this.password;
    var tls = this.tls;
    var type = this.type;
    var username = this.username;

    final json = <String, Object?>{};
    if (hash != null) {
      json[r'hash'] = hash;
    }
    if (password != null) {
      json[r'password'] = password;
    }
    if (tls != null) {
      json[r'tls'] = tls;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    if (username != null) {
      json[r'username'] = username;
    }
    return json;
  }

  ModelsKafkaAuth copyWith({
    String? hash,
    String? password,
    bool? tls,
    String? type,
    String? username,
  }) {
    return ModelsKafkaAuth(
      hash: hash ?? this.hash,
      password: password ?? this.password,
      tls: tls ?? this.tls,
      type: type ?? this.type,
      username: username ?? this.username,
    );
  }
}

class ModelsKafkaPubSubConfig {
  final ModelsKafkaAuth? auth;
  final List<String>? brokers;
  final String? consumerGroupId;
  final String? topicName;

  ModelsKafkaPubSubConfig({
    this.auth,
    this.brokers,
    this.consumerGroupId,
    this.topicName,
  });

  factory ModelsKafkaPubSubConfig.fromJson(Map<String, Object?> json) {
    return ModelsKafkaPubSubConfig(
      auth: json[r'auth'] != null
          ? ModelsKafkaAuth.fromJson(json[r'auth']! as Map<String, Object?>)
          : null,
      brokers: (json[r'brokers'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      consumerGroupId: json[r'consumer_group_id'] as String?,
      topicName: json[r'topic_name'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var auth = this.auth;
    var brokers = this.brokers;
    var consumerGroupId = this.consumerGroupId;
    var topicName = this.topicName;

    final json = <String, Object?>{};
    if (auth != null) {
      json[r'auth'] = auth.toJson();
    }
    if (brokers != null) {
      json[r'brokers'] = brokers;
    }
    if (consumerGroupId != null) {
      json[r'consumer_group_id'] = consumerGroupId;
    }
    if (topicName != null) {
      json[r'topic_name'] = topicName;
    }
    return json;
  }

  ModelsKafkaPubSubConfig copyWith({
    ModelsKafkaAuth? auth,
    List<String>? brokers,
    String? consumerGroupId,
    String? topicName,
  }) {
    return ModelsKafkaPubSubConfig(
      auth: auth ?? this.auth,
      brokers: brokers ?? this.brokers,
      consumerGroupId: consumerGroupId ?? this.consumerGroupId,
      topicName: topicName ?? this.topicName,
    );
  }
}

class ModelsMetaEventResponse {
  final DatastoreMetaEventAttempt? attempt;
  final String? createdAt;
  final String? deletedAt;
  final String? eventType;
  final DatastoreMetadata? metadata;
  final String? projectId;
  final DatastoreEventDeliveryStatus? status;
  final String? uid;
  final String? updatedAt;

  ModelsMetaEventResponse({
    this.attempt,
    this.createdAt,
    this.deletedAt,
    this.eventType,
    this.metadata,
    this.projectId,
    this.status,
    this.uid,
    this.updatedAt,
  });

  factory ModelsMetaEventResponse.fromJson(Map<String, Object?> json) {
    return ModelsMetaEventResponse(
      attempt: json[r'attempt'] != null
          ? DatastoreMetaEventAttempt.fromJson(
              json[r'attempt']! as Map<String, Object?>,
            )
          : null,
      createdAt: json[r'created_at'] as String?,
      deletedAt: json[r'deleted_at'] as String?,
      eventType: json[r'event_type'] as String?,
      metadata: json[r'metadata'] != null
          ? DatastoreMetadata.fromJson(
              json[r'metadata']! as Map<String, Object?>,
            )
          : null,
      projectId: json[r'project_id'] as String?,
      status: json[r'status'] != null
          ? DatastoreEventDeliveryStatus.fromValue(json[r'status']! as String)
          : null,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var attempt = this.attempt;
    var createdAt = this.createdAt;
    var deletedAt = this.deletedAt;
    var eventType = this.eventType;
    var metadata = this.metadata;
    var projectId = this.projectId;
    var status = this.status;
    var uid = this.uid;
    var updatedAt = this.updatedAt;

    final json = <String, Object?>{};
    if (attempt != null) {
      json[r'attempt'] = attempt.toJson();
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata.toJson();
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (status != null) {
      json[r'status'] = status.value;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    return json;
  }

  ModelsMetaEventResponse copyWith({
    DatastoreMetaEventAttempt? attempt,
    String? createdAt,
    String? deletedAt,
    String? eventType,
    DatastoreMetadata? metadata,
    String? projectId,
    DatastoreEventDeliveryStatus? status,
    String? uid,
    String? updatedAt,
  }) {
    return ModelsMetaEventResponse(
      attempt: attempt ?? this.attempt,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      eventType: eventType ?? this.eventType,
      metadata: metadata ?? this.metadata,
      projectId: projectId ?? this.projectId,
      status: status ?? this.status,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ModelsMtlsClientCert {
  /// ClientCert is the client certificate PEM string
  final String? clientCert;

  /// ClientKey is the client private key PEM string
  final String? clientKey;

  ModelsMtlsClientCert({this.clientCert, this.clientKey});

  factory ModelsMtlsClientCert.fromJson(Map<String, Object?> json) {
    return ModelsMtlsClientCert(
      clientCert: json[r'client_cert'] as String?,
      clientKey: json[r'client_key'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var clientCert = this.clientCert;
    var clientKey = this.clientKey;

    final json = <String, Object?>{};
    if (clientCert != null) {
      json[r'client_cert'] = clientCert;
    }
    if (clientKey != null) {
      json[r'client_key'] = clientKey;
    }
    return json;
  }

  ModelsMtlsClientCert copyWith({String? clientCert, String? clientKey}) {
    return ModelsMtlsClientCert(
      clientCert: clientCert ?? this.clientCert,
      clientKey: clientKey ?? this.clientKey,
    );
  }
}

class ModelsOAuth2 {
  final String? audience;
  final String? authenticationType;
  final String? clientId;
  final String? clientSecret;

  /// Expiry time unit (seconds, milliseconds, minutes, hours)
  final String? expiryTimeUnit;

  /// Field mapping for flexible token response parsing
  final ModelsOAuth2FieldMapping? fieldMapping;
  final String? grantType;
  final String? issuer;
  final String? scope;
  final String? signingAlgorithm;
  final ModelsOAuth2SigningKey? signingKey;
  final String? subject;
  final String? url;

  ModelsOAuth2({
    this.audience,
    this.authenticationType,
    this.clientId,
    this.clientSecret,
    this.expiryTimeUnit,
    this.fieldMapping,
    this.grantType,
    this.issuer,
    this.scope,
    this.signingAlgorithm,
    this.signingKey,
    this.subject,
    this.url,
  });

  factory ModelsOAuth2.fromJson(Map<String, Object?> json) {
    return ModelsOAuth2(
      audience: json[r'audience'] as String?,
      authenticationType: json[r'authentication_type'] as String?,
      clientId: json[r'client_id'] as String?,
      clientSecret: json[r'client_secret'] as String?,
      expiryTimeUnit: json[r'expiry_time_unit'] as String?,
      fieldMapping: json[r'field_mapping'] != null
          ? ModelsOAuth2FieldMapping.fromJson(
              json[r'field_mapping']! as Map<String, Object?>,
            )
          : null,
      grantType: json[r'grant_type'] as String?,
      issuer: json[r'issuer'] as String?,
      scope: json[r'scope'] as String?,
      signingAlgorithm: json[r'signing_algorithm'] as String?,
      signingKey: json[r'signing_key'] != null
          ? ModelsOAuth2SigningKey.fromJson(
              json[r'signing_key']! as Map<String, Object?>,
            )
          : null,
      subject: json[r'subject'] as String?,
      url: json[r'url'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var audience = this.audience;
    var authenticationType = this.authenticationType;
    var clientId = this.clientId;
    var clientSecret = this.clientSecret;
    var expiryTimeUnit = this.expiryTimeUnit;
    var fieldMapping = this.fieldMapping;
    var grantType = this.grantType;
    var issuer = this.issuer;
    var scope = this.scope;
    var signingAlgorithm = this.signingAlgorithm;
    var signingKey = this.signingKey;
    var subject = this.subject;
    var url = this.url;

    final json = <String, Object?>{};
    if (audience != null) {
      json[r'audience'] = audience;
    }
    if (authenticationType != null) {
      json[r'authentication_type'] = authenticationType;
    }
    if (clientId != null) {
      json[r'client_id'] = clientId;
    }
    if (clientSecret != null) {
      json[r'client_secret'] = clientSecret;
    }
    if (expiryTimeUnit != null) {
      json[r'expiry_time_unit'] = expiryTimeUnit;
    }
    if (fieldMapping != null) {
      json[r'field_mapping'] = fieldMapping.toJson();
    }
    if (grantType != null) {
      json[r'grant_type'] = grantType;
    }
    if (issuer != null) {
      json[r'issuer'] = issuer;
    }
    if (scope != null) {
      json[r'scope'] = scope;
    }
    if (signingAlgorithm != null) {
      json[r'signing_algorithm'] = signingAlgorithm;
    }
    if (signingKey != null) {
      json[r'signing_key'] = signingKey.toJson();
    }
    if (subject != null) {
      json[r'subject'] = subject;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    return json;
  }

  ModelsOAuth2 copyWith({
    String? audience,
    String? authenticationType,
    String? clientId,
    String? clientSecret,
    String? expiryTimeUnit,
    ModelsOAuth2FieldMapping? fieldMapping,
    String? grantType,
    String? issuer,
    String? scope,
    String? signingAlgorithm,
    ModelsOAuth2SigningKey? signingKey,
    String? subject,
    String? url,
  }) {
    return ModelsOAuth2(
      audience: audience ?? this.audience,
      authenticationType: authenticationType ?? this.authenticationType,
      clientId: clientId ?? this.clientId,
      clientSecret: clientSecret ?? this.clientSecret,
      expiryTimeUnit: expiryTimeUnit ?? this.expiryTimeUnit,
      fieldMapping: fieldMapping ?? this.fieldMapping,
      grantType: grantType ?? this.grantType,
      issuer: issuer ?? this.issuer,
      scope: scope ?? this.scope,
      signingAlgorithm: signingAlgorithm ?? this.signingAlgorithm,
      signingKey: signingKey ?? this.signingKey,
      subject: subject ?? this.subject,
      url: url ?? this.url,
    );
  }
}

class ModelsOAuth2FieldMapping {
  /// Field name for access token (e.g., "accessToken", "access_token", "token")
  final String? accessToken;

  /// Field name for expiry time (e.g., "expiresIn", "expires_in", "expiresAt")
  final String? expiresIn;

  /// Field name for token type (e.g., "tokenType", "token_type")
  final String? tokenType;

  ModelsOAuth2FieldMapping({this.accessToken, this.expiresIn, this.tokenType});

  factory ModelsOAuth2FieldMapping.fromJson(Map<String, Object?> json) {
    return ModelsOAuth2FieldMapping(
      accessToken: json[r'access_token'] as String?,
      expiresIn: json[r'expires_in'] as String?,
      tokenType: json[r'token_type'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var accessToken = this.accessToken;
    var expiresIn = this.expiresIn;
    var tokenType = this.tokenType;

    final json = <String, Object?>{};
    if (accessToken != null) {
      json[r'access_token'] = accessToken;
    }
    if (expiresIn != null) {
      json[r'expires_in'] = expiresIn;
    }
    if (tokenType != null) {
      json[r'token_type'] = tokenType;
    }
    return json;
  }

  ModelsOAuth2FieldMapping copyWith({
    String? accessToken,
    String? expiresIn,
    String? tokenType,
  }) {
    return ModelsOAuth2FieldMapping(
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      tokenType: tokenType ?? this.tokenType,
    );
  }
}

class ModelsOAuth2SigningKey {
  /// EC (Elliptic Curve) key fields
  final String? crv;

  /// Private key (EC) or private exponent (RSA)
  final String? d;

  /// RSA first factor CRT exponent (RSA private key only)
  final String? dp;

  /// RSA second factor CRT exponent (RSA private key only)
  final String? dq;

  /// RSA public exponent (RSA only)
  final String? e;

  /// Key ID
  final String? kid;

  /// Key type: "EC" or "RSA"
  final String? kty;

  /// RSA key fields
  final String? n;

  /// RSA first prime factor (RSA private key only)
  final String? p;

  /// RSA second prime factor (RSA private key only)
  final String? q;

  /// RSA first CRT coefficient (RSA private key only)
  final String? qi;

  /// X coordinate (EC only)
  final String? x;

  /// Y coordinate (EC only)
  final String? y;

  ModelsOAuth2SigningKey({
    this.crv,
    this.d,
    this.dp,
    this.dq,
    this.e,
    this.kid,
    this.kty,
    this.n,
    this.p,
    this.q,
    this.qi,
    this.x,
    this.y,
  });

  factory ModelsOAuth2SigningKey.fromJson(Map<String, Object?> json) {
    return ModelsOAuth2SigningKey(
      crv: json[r'crv'] as String?,
      d: json[r'd'] as String?,
      dp: json[r'dp'] as String?,
      dq: json[r'dq'] as String?,
      e: json[r'e'] as String?,
      kid: json[r'kid'] as String?,
      kty: json[r'kty'] as String?,
      n: json[r'n'] as String?,
      p: json[r'p'] as String?,
      q: json[r'q'] as String?,
      qi: json[r'qi'] as String?,
      x: json[r'x'] as String?,
      y: json[r'y'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var crv = this.crv;
    var d = this.d;
    var dp = this.dp;
    var dq = this.dq;
    var e = this.e;
    var kid = this.kid;
    var kty = this.kty;
    var n = this.n;
    var p = this.p;
    var q = this.q;
    var qi = this.qi;
    var x = this.x;
    var y = this.y;

    final json = <String, Object?>{};
    if (crv != null) {
      json[r'crv'] = crv;
    }
    if (d != null) {
      json[r'd'] = d;
    }
    if (dp != null) {
      json[r'dp'] = dp;
    }
    if (dq != null) {
      json[r'dq'] = dq;
    }
    if (e != null) {
      json[r'e'] = e;
    }
    if (kid != null) {
      json[r'kid'] = kid;
    }
    if (kty != null) {
      json[r'kty'] = kty;
    }
    if (n != null) {
      json[r'n'] = n;
    }
    if (p != null) {
      json[r'p'] = p;
    }
    if (q != null) {
      json[r'q'] = q;
    }
    if (qi != null) {
      json[r'qi'] = qi;
    }
    if (x != null) {
      json[r'x'] = x;
    }
    if (y != null) {
      json[r'y'] = y;
    }
    return json;
  }

  ModelsOAuth2SigningKey copyWith({
    String? crv,
    String? d,
    String? dp,
    String? dq,
    String? e,
    String? kid,
    String? kty,
    String? n,
    String? p,
    String? q,
    String? qi,
    String? x,
    String? y,
  }) {
    return ModelsOAuth2SigningKey(
      crv: crv ?? this.crv,
      d: d ?? this.d,
      dp: dp ?? this.dp,
      dq: dq ?? this.dq,
      e: e ?? this.e,
      kid: kid ?? this.kid,
      kty: kty ?? this.kty,
      n: n ?? this.n,
      p: p ?? this.p,
      q: q ?? this.q,
      qi: qi ?? this.qi,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }
}

class ModelsPagedResponse {
  final Object? content;
  final DatastorePaginationData? pagination;

  ModelsPagedResponse({this.content, this.pagination});

  factory ModelsPagedResponse.fromJson(Map<String, Object?> json) {
    return ModelsPagedResponse(
      content: json[r'content'],
      pagination: json[r'pagination'] != null
          ? DatastorePaginationData.fromJson(
              json[r'pagination']! as Map<String, Object?>,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var content = this.content;
    var pagination = this.pagination;

    final json = <String, Object?>{};
    if (content != null) {
      json[r'content'] = content;
    }
    if (pagination != null) {
      json[r'pagination'] = pagination.toJson();
    }
    return json;
  }

  ModelsPagedResponse copyWith({
    Object? content,
    DatastorePaginationData? pagination,
  }) {
    return ModelsPagedResponse(
      content: content ?? this.content,
      pagination: pagination ?? this.pagination,
    );
  }
}

class ModelsPubSubConfig {
  final ModelsAmqpPubSubconfig? amqp;
  final ModelsGooglePubSubConfig? google;
  final ModelsKafkaPubSubConfig? kafka;
  final ModelsSQSPubSubConfig? sqs;
  final DatastorePubSubType? type;
  final int? workers;

  ModelsPubSubConfig({
    this.amqp,
    this.google,
    this.kafka,
    this.sqs,
    this.type,
    this.workers,
  });

  factory ModelsPubSubConfig.fromJson(Map<String, Object?> json) {
    return ModelsPubSubConfig(
      amqp: json[r'amqp'] != null
          ? ModelsAmqpPubSubconfig.fromJson(
              json[r'amqp']! as Map<String, Object?>,
            )
          : null,
      google: json[r'google'] != null
          ? ModelsGooglePubSubConfig.fromJson(
              json[r'google']! as Map<String, Object?>,
            )
          : null,
      kafka: json[r'kafka'] != null
          ? ModelsKafkaPubSubConfig.fromJson(
              json[r'kafka']! as Map<String, Object?>,
            )
          : null,
      sqs: json[r'sqs'] != null
          ? ModelsSQSPubSubConfig.fromJson(
              json[r'sqs']! as Map<String, Object?>,
            )
          : null,
      type: json[r'type'] != null
          ? DatastorePubSubType.fromValue(json[r'type']! as String)
          : null,
      workers: (json[r'workers'] as num?)?.toInt(),
    );
  }

  Map<String, Object?> toJson() {
    var amqp = this.amqp;
    var google = this.google;
    var kafka = this.kafka;
    var sqs = this.sqs;
    var type = this.type;
    var workers = this.workers;

    final json = <String, Object?>{};
    if (amqp != null) {
      json[r'amqp'] = amqp.toJson();
    }
    if (google != null) {
      json[r'google'] = google.toJson();
    }
    if (kafka != null) {
      json[r'kafka'] = kafka.toJson();
    }
    if (sqs != null) {
      json[r'sqs'] = sqs.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    if (workers != null) {
      json[r'workers'] = workers;
    }
    return json;
  }

  ModelsPubSubConfig copyWith({
    ModelsAmqpPubSubconfig? amqp,
    ModelsGooglePubSubConfig? google,
    ModelsKafkaPubSubConfig? kafka,
    ModelsSQSPubSubConfig? sqs,
    DatastorePubSubType? type,
    int? workers,
  }) {
    return ModelsPubSubConfig(
      amqp: amqp ?? this.amqp,
      google: google ?? this.google,
      kafka: kafka ?? this.kafka,
      sqs: sqs ?? this.sqs,
      type: type ?? this.type,
      workers: workers ?? this.workers,
    );
  }
}

class ModelsRateLimitConfiguration {
  final int? count;
  final int? duration;

  ModelsRateLimitConfiguration({this.count, this.duration});

  factory ModelsRateLimitConfiguration.fromJson(Map<String, Object?> json) {
    return ModelsRateLimitConfiguration(
      count: (json[r'count'] as num?)?.toInt(),
      duration: (json[r'duration'] as num?)?.toInt(),
    );
  }

  Map<String, Object?> toJson() {
    var count = this.count;
    var duration = this.duration;

    final json = <String, Object?>{};
    if (count != null) {
      json[r'count'] = count;
    }
    if (duration != null) {
      json[r'duration'] = duration;
    }
    return json;
  }

  ModelsRateLimitConfiguration copyWith({int? count, int? duration}) {
    return ModelsRateLimitConfiguration(
      count: count ?? this.count,
      duration: duration ?? this.duration,
    );
  }
}

class ModelsRetryConfiguration {
  /// Used to specify a valid Go time duration e.g 10s, 1h3m for how long to
  /// wait between event delivery retries
  final String? duration;

  /// Used to specify a time in seconds for how long to wait between event
  /// delivery retries,
  final int? intervalSeconds;

  /// Used to specify the max number of retries
  final int? retryCount;

  /// Retry Strategy type
  final DatastoreStrategyProvider? type;

  ModelsRetryConfiguration({
    this.duration,
    this.intervalSeconds,
    this.retryCount,
    this.type,
  });

  factory ModelsRetryConfiguration.fromJson(Map<String, Object?> json) {
    return ModelsRetryConfiguration(
      duration: json[r'duration'] as String?,
      intervalSeconds: (json[r'interval_seconds'] as num?)?.toInt(),
      retryCount: (json[r'retry_count'] as num?)?.toInt(),
      type: json[r'type'] != null
          ? DatastoreStrategyProvider.fromValue(json[r'type']! as String)
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var duration = this.duration;
    var intervalSeconds = this.intervalSeconds;
    var retryCount = this.retryCount;
    var type = this.type;

    final json = <String, Object?>{};
    if (duration != null) {
      json[r'duration'] = duration;
    }
    if (intervalSeconds != null) {
      json[r'interval_seconds'] = intervalSeconds;
    }
    if (retryCount != null) {
      json[r'retry_count'] = retryCount;
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    return json;
  }

  ModelsRetryConfiguration copyWith({
    String? duration,
    int? intervalSeconds,
    int? retryCount,
    DatastoreStrategyProvider? type,
  }) {
    return ModelsRetryConfiguration(
      duration: duration ?? this.duration,
      intervalSeconds: intervalSeconds ?? this.intervalSeconds,
      retryCount: retryCount ?? this.retryCount,
      type: type ?? this.type,
    );
  }
}

class ModelsSQSPubSubConfig {
  final String? accessKeyId;
  final String? defaultRegion;
  final String? queueName;
  final String? secretKey;

  ModelsSQSPubSubConfig({
    this.accessKeyId,
    this.defaultRegion,
    this.queueName,
    this.secretKey,
  });

  factory ModelsSQSPubSubConfig.fromJson(Map<String, Object?> json) {
    return ModelsSQSPubSubConfig(
      accessKeyId: json[r'access_key_id'] as String?,
      defaultRegion: json[r'default_region'] as String?,
      queueName: json[r'queue_name'] as String?,
      secretKey: json[r'secret_key'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var accessKeyId = this.accessKeyId;
    var defaultRegion = this.defaultRegion;
    var queueName = this.queueName;
    var secretKey = this.secretKey;

    final json = <String, Object?>{};
    if (accessKeyId != null) {
      json[r'access_key_id'] = accessKeyId;
    }
    if (defaultRegion != null) {
      json[r'default_region'] = defaultRegion;
    }
    if (queueName != null) {
      json[r'queue_name'] = queueName;
    }
    if (secretKey != null) {
      json[r'secret_key'] = secretKey;
    }
    return json;
  }

  ModelsSQSPubSubConfig copyWith({
    String? accessKeyId,
    String? defaultRegion,
    String? queueName,
    String? secretKey,
  }) {
    return ModelsSQSPubSubConfig(
      accessKeyId: accessKeyId ?? this.accessKeyId,
      defaultRegion: defaultRegion ?? this.defaultRegion,
      queueName: queueName ?? this.queueName,
      secretKey: secretKey ?? this.secretKey,
    );
  }
}

class ModelsSourceResponse {
  final String? bodyFunction;
  final String? createdAt;
  final DatastoreCustomResponse? customResponse;
  final String? deletedAt;
  final List<String>? forwardHeaders;
  final String? headerFunction;
  final List<String>? idempotencyKeys;
  final bool? isDisabled;
  final String? maskId;
  final String? name;
  final String? projectId;
  final DatastoreSourceProvider? provider;
  final DatastoreProviderConfig? providerConfig;
  final DatastorePubSubConfig? pubSub;
  final DatastoreSourceType? type;
  final String? uid;
  final String? updatedAt;
  final String? url;
  final DatastoreVerifierConfig? verifier;

  ModelsSourceResponse({
    this.bodyFunction,
    this.createdAt,
    this.customResponse,
    this.deletedAt,
    this.forwardHeaders,
    this.headerFunction,
    this.idempotencyKeys,
    this.isDisabled,
    this.maskId,
    this.name,
    this.projectId,
    this.provider,
    this.providerConfig,
    this.pubSub,
    this.type,
    this.uid,
    this.updatedAt,
    this.url,
    this.verifier,
  });

  factory ModelsSourceResponse.fromJson(Map<String, Object?> json) {
    return ModelsSourceResponse(
      bodyFunction: json[r'body_function'] as String?,
      createdAt: json[r'created_at'] as String?,
      customResponse: json[r'custom_response'] != null
          ? DatastoreCustomResponse.fromJson(
              json[r'custom_response']! as Map<String, Object?>,
            )
          : null,
      deletedAt: json[r'deleted_at'] as String?,
      forwardHeaders: (json[r'forward_headers'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      headerFunction: json[r'header_function'] as String?,
      idempotencyKeys: (json[r'idempotency_keys'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      isDisabled: json[r'is_disabled'] as bool?,
      maskId: json[r'mask_id'] as String?,
      name: json[r'name'] as String?,
      projectId: json[r'project_id'] as String?,
      provider: json[r'provider'] != null
          ? DatastoreSourceProvider.fromValue(json[r'provider']! as String)
          : null,
      providerConfig: json[r'provider_config'] != null
          ? DatastoreProviderConfig.fromJson(
              json[r'provider_config']! as Map<String, Object?>,
            )
          : null,
      pubSub: json[r'pub_sub'] != null
          ? DatastorePubSubConfig.fromJson(
              json[r'pub_sub']! as Map<String, Object?>,
            )
          : null,
      type: json[r'type'] != null
          ? DatastoreSourceType.fromValue(json[r'type']! as String)
          : null,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
      url: json[r'url'] as String?,
      verifier: json[r'verifier'] != null
          ? DatastoreVerifierConfig.fromJson(
              json[r'verifier']! as Map<String, Object?>,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var bodyFunction = this.bodyFunction;
    var createdAt = this.createdAt;
    var customResponse = this.customResponse;
    var deletedAt = this.deletedAt;
    var forwardHeaders = this.forwardHeaders;
    var headerFunction = this.headerFunction;
    var idempotencyKeys = this.idempotencyKeys;
    var isDisabled = this.isDisabled;
    var maskId = this.maskId;
    var name = this.name;
    var projectId = this.projectId;
    var provider = this.provider;
    var providerConfig = this.providerConfig;
    var pubSub = this.pubSub;
    var type = this.type;
    var uid = this.uid;
    var updatedAt = this.updatedAt;
    var url = this.url;
    var verifier = this.verifier;

    final json = <String, Object?>{};
    if (bodyFunction != null) {
      json[r'body_function'] = bodyFunction;
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (customResponse != null) {
      json[r'custom_response'] = customResponse.toJson();
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (forwardHeaders != null) {
      json[r'forward_headers'] = forwardHeaders;
    }
    if (headerFunction != null) {
      json[r'header_function'] = headerFunction;
    }
    if (idempotencyKeys != null) {
      json[r'idempotency_keys'] = idempotencyKeys;
    }
    if (isDisabled != null) {
      json[r'is_disabled'] = isDisabled;
    }
    if (maskId != null) {
      json[r'mask_id'] = maskId;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (provider != null) {
      json[r'provider'] = provider.value;
    }
    if (providerConfig != null) {
      json[r'provider_config'] = providerConfig.toJson();
    }
    if (pubSub != null) {
      json[r'pub_sub'] = pubSub.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    if (verifier != null) {
      json[r'verifier'] = verifier.toJson();
    }
    return json;
  }

  ModelsSourceResponse copyWith({
    String? bodyFunction,
    String? createdAt,
    DatastoreCustomResponse? customResponse,
    String? deletedAt,
    List<String>? forwardHeaders,
    String? headerFunction,
    List<String>? idempotencyKeys,
    bool? isDisabled,
    String? maskId,
    String? name,
    String? projectId,
    DatastoreSourceProvider? provider,
    DatastoreProviderConfig? providerConfig,
    DatastorePubSubConfig? pubSub,
    DatastoreSourceType? type,
    String? uid,
    String? updatedAt,
    String? url,
    DatastoreVerifierConfig? verifier,
  }) {
    return ModelsSourceResponse(
      bodyFunction: bodyFunction ?? this.bodyFunction,
      createdAt: createdAt ?? this.createdAt,
      customResponse: customResponse ?? this.customResponse,
      deletedAt: deletedAt ?? this.deletedAt,
      forwardHeaders: forwardHeaders ?? this.forwardHeaders,
      headerFunction: headerFunction ?? this.headerFunction,
      idempotencyKeys: idempotencyKeys ?? this.idempotencyKeys,
      isDisabled: isDisabled ?? this.isDisabled,
      maskId: maskId ?? this.maskId,
      name: name ?? this.name,
      projectId: projectId ?? this.projectId,
      provider: provider ?? this.provider,
      providerConfig: providerConfig ?? this.providerConfig,
      pubSub: pubSub ?? this.pubSub,
      type: type ?? this.type,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
      verifier: verifier ?? this.verifier,
    );
  }
}

class ModelsSubscriptionResponse {
  /// subscription config
  final DatastoreAlertConfiguration? alertConfig;
  final String? createdAt;
  final String? deletedAt;
  final DatastoreDeliveryMode? deliveryMode;
  final DatastoreDevice? deviceMetadata;
  final DatastoreEndpoint? endpointMetadata;
  final DatastoreFilterConfiguration? filterConfig;
  final String? function;
  final String? name;
  final String? projectId;
  final DatastoreRateLimitConfiguration? rateLimitConfig;
  final DatastoreRetryConfiguration? retryConfig;
  final DatastoreSource? sourceMetadata;
  final DatastoreSubscriptionType? type;
  final String? uid;
  final String? updatedAt;

  ModelsSubscriptionResponse({
    this.alertConfig,
    this.createdAt,
    this.deletedAt,
    this.deliveryMode,
    this.deviceMetadata,
    this.endpointMetadata,
    this.filterConfig,
    this.function,
    this.name,
    this.projectId,
    this.rateLimitConfig,
    this.retryConfig,
    this.sourceMetadata,
    this.type,
    this.uid,
    this.updatedAt,
  });

  factory ModelsSubscriptionResponse.fromJson(Map<String, Object?> json) {
    return ModelsSubscriptionResponse(
      alertConfig: json[r'alert_config'] != null
          ? DatastoreAlertConfiguration.fromJson(
              json[r'alert_config']! as Map<String, Object?>,
            )
          : null,
      createdAt: json[r'created_at'] as String?,
      deletedAt: json[r'deleted_at'] as String?,
      deliveryMode: json[r'delivery_mode'] != null
          ? DatastoreDeliveryMode.fromValue(json[r'delivery_mode']! as String)
          : null,
      deviceMetadata: json[r'device_metadata'] != null
          ? DatastoreDevice.fromJson(
              json[r'device_metadata']! as Map<String, Object?>,
            )
          : null,
      endpointMetadata: json[r'endpoint_metadata'] != null
          ? DatastoreEndpoint.fromJson(
              json[r'endpoint_metadata']! as Map<String, Object?>,
            )
          : null,
      filterConfig: json[r'filter_config'] != null
          ? DatastoreFilterConfiguration.fromJson(
              json[r'filter_config']! as Map<String, Object?>,
            )
          : null,
      function: json[r'function'] as String?,
      name: json[r'name'] as String?,
      projectId: json[r'project_id'] as String?,
      rateLimitConfig: json[r'rate_limit_config'] != null
          ? DatastoreRateLimitConfiguration.fromJson(
              json[r'rate_limit_config']! as Map<String, Object?>,
            )
          : null,
      retryConfig: json[r'retry_config'] != null
          ? DatastoreRetryConfiguration.fromJson(
              json[r'retry_config']! as Map<String, Object?>,
            )
          : null,
      sourceMetadata: json[r'source_metadata'] != null
          ? DatastoreSource.fromJson(
              json[r'source_metadata']! as Map<String, Object?>,
            )
          : null,
      type: json[r'type'] != null
          ? DatastoreSubscriptionType.fromValue(json[r'type']! as String)
          : null,
      uid: json[r'uid'] as String?,
      updatedAt: json[r'updated_at'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var alertConfig = this.alertConfig;
    var createdAt = this.createdAt;
    var deletedAt = this.deletedAt;
    var deliveryMode = this.deliveryMode;
    var deviceMetadata = this.deviceMetadata;
    var endpointMetadata = this.endpointMetadata;
    var filterConfig = this.filterConfig;
    var function = this.function;
    var name = this.name;
    var projectId = this.projectId;
    var rateLimitConfig = this.rateLimitConfig;
    var retryConfig = this.retryConfig;
    var sourceMetadata = this.sourceMetadata;
    var type = this.type;
    var uid = this.uid;
    var updatedAt = this.updatedAt;

    final json = <String, Object?>{};
    if (alertConfig != null) {
      json[r'alert_config'] = alertConfig.toJson();
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    if (deletedAt != null) {
      json[r'deleted_at'] = deletedAt;
    }
    if (deliveryMode != null) {
      json[r'delivery_mode'] = deliveryMode.value;
    }
    if (deviceMetadata != null) {
      json[r'device_metadata'] = deviceMetadata.toJson();
    }
    if (endpointMetadata != null) {
      json[r'endpoint_metadata'] = endpointMetadata.toJson();
    }
    if (filterConfig != null) {
      json[r'filter_config'] = filterConfig.toJson();
    }
    if (function != null) {
      json[r'function'] = function;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (projectId != null) {
      json[r'project_id'] = projectId;
    }
    if (rateLimitConfig != null) {
      json[r'rate_limit_config'] = rateLimitConfig.toJson();
    }
    if (retryConfig != null) {
      json[r'retry_config'] = retryConfig.toJson();
    }
    if (sourceMetadata != null) {
      json[r'source_metadata'] = sourceMetadata.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    if (updatedAt != null) {
      json[r'updated_at'] = updatedAt;
    }
    return json;
  }

  ModelsSubscriptionResponse copyWith({
    DatastoreAlertConfiguration? alertConfig,
    String? createdAt,
    String? deletedAt,
    DatastoreDeliveryMode? deliveryMode,
    DatastoreDevice? deviceMetadata,
    DatastoreEndpoint? endpointMetadata,
    DatastoreFilterConfiguration? filterConfig,
    String? function,
    String? name,
    String? projectId,
    DatastoreRateLimitConfiguration? rateLimitConfig,
    DatastoreRetryConfiguration? retryConfig,
    DatastoreSource? sourceMetadata,
    DatastoreSubscriptionType? type,
    String? uid,
    String? updatedAt,
  }) {
    return ModelsSubscriptionResponse(
      alertConfig: alertConfig ?? this.alertConfig,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      deviceMetadata: deviceMetadata ?? this.deviceMetadata,
      endpointMetadata: endpointMetadata ?? this.endpointMetadata,
      filterConfig: filterConfig ?? this.filterConfig,
      function: function ?? this.function,
      name: name ?? this.name,
      projectId: projectId ?? this.projectId,
      rateLimitConfig: rateLimitConfig ?? this.rateLimitConfig,
      retryConfig: retryConfig ?? this.retryConfig,
      sourceMetadata: sourceMetadata ?? this.sourceMetadata,
      type: type ?? this.type,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ModelsTestFilter {
  /// Same Request & Headers
  final ModelsFilterSchema? request;

  /// Sample test schema
  final ModelsFilterSchema? schema;

  ModelsTestFilter({this.request, this.schema});

  factory ModelsTestFilter.fromJson(Map<String, Object?> json) {
    return ModelsTestFilter(
      request: json[r'request'] != null
          ? ModelsFilterSchema.fromJson(
              json[r'request']! as Map<String, Object?>,
            )
          : null,
      schema: json[r'schema'] != null
          ? ModelsFilterSchema.fromJson(
              json[r'schema']! as Map<String, Object?>,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var request = this.request;
    var schema = this.schema;

    final json = <String, Object?>{};
    if (request != null) {
      json[r'request'] = request.toJson();
    }
    if (schema != null) {
      json[r'schema'] = schema.toJson();
    }
    return json;
  }

  ModelsTestFilter copyWith({
    ModelsFilterSchema? request,
    ModelsFilterSchema? schema,
  }) {
    return ModelsTestFilter(
      request: request ?? this.request,
      schema: schema ?? this.schema,
    );
  }
}

class ModelsTestFilterRequest {
  /// Sample payload to test against the filter (required)
  final Object payload;

  ModelsTestFilterRequest({required this.payload});

  factory ModelsTestFilterRequest.fromJson(Map<String, Object?> json) {
    return ModelsTestFilterRequest(payload: json[r'payload'] ?? {});
  }

  Map<String, Object?> toJson() {
    var payload = this.payload;

    final json = <String, Object?>{};
    json[r'payload'] = payload;
    return json;
  }

  ModelsTestFilterRequest copyWith({Object? payload}) {
    return ModelsTestFilterRequest(payload: payload ?? this.payload);
  }
}

class ModelsTestFilterResponse {
  /// Whether the payload matches the filter criteria
  final bool? isMatch;

  ModelsTestFilterResponse({this.isMatch});

  factory ModelsTestFilterResponse.fromJson(Map<String, Object?> json) {
    return ModelsTestFilterResponse(isMatch: json[r'is_match'] as bool?);
  }

  Map<String, Object?> toJson() {
    var isMatch = this.isMatch;

    final json = <String, Object?>{};
    if (isMatch != null) {
      json[r'is_match'] = isMatch;
    }
    return json;
  }

  ModelsTestFilterResponse copyWith({bool? isMatch}) {
    return ModelsTestFilterResponse(isMatch: isMatch ?? this.isMatch);
  }
}

class ModelsTestOAuth2Request {
  final ModelsOAuth2? oauth2;

  ModelsTestOAuth2Request({this.oauth2});

  factory ModelsTestOAuth2Request.fromJson(Map<String, Object?> json) {
    return ModelsTestOAuth2Request(
      oauth2: json[r'oauth2'] != null
          ? ModelsOAuth2.fromJson(json[r'oauth2']! as Map<String, Object?>)
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var oauth2 = this.oauth2;

    final json = <String, Object?>{};
    if (oauth2 != null) {
      json[r'oauth2'] = oauth2.toJson();
    }
    return json;
  }

  ModelsTestOAuth2Request copyWith({ModelsOAuth2? oauth2}) {
    return ModelsTestOAuth2Request(oauth2: oauth2 ?? this.oauth2);
  }
}

class ModelsTestOAuth2Response {
  final String? accessToken;
  final String? error;
  final String? expiresAt;
  final String? message;
  final bool? success;
  final String? tokenType;

  ModelsTestOAuth2Response({
    this.accessToken,
    this.error,
    this.expiresAt,
    this.message,
    this.success,
    this.tokenType,
  });

  factory ModelsTestOAuth2Response.fromJson(Map<String, Object?> json) {
    return ModelsTestOAuth2Response(
      accessToken: json[r'access_token'] as String?,
      error: json[r'error'] as String?,
      expiresAt: json[r'expires_at'] as String?,
      message: json[r'message'] as String?,
      success: json[r'success'] as bool?,
      tokenType: json[r'token_type'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var accessToken = this.accessToken;
    var error = this.error;
    var expiresAt = this.expiresAt;
    var message = this.message;
    var success = this.success;
    var tokenType = this.tokenType;

    final json = <String, Object?>{};
    if (accessToken != null) {
      json[r'access_token'] = accessToken;
    }
    if (error != null) {
      json[r'error'] = error;
    }
    if (expiresAt != null) {
      json[r'expires_at'] = expiresAt;
    }
    if (message != null) {
      json[r'message'] = message;
    }
    if (success != null) {
      json[r'success'] = success;
    }
    if (tokenType != null) {
      json[r'token_type'] = tokenType;
    }
    return json;
  }

  ModelsTestOAuth2Response copyWith({
    String? accessToken,
    String? error,
    String? expiresAt,
    String? message,
    bool? success,
    String? tokenType,
  }) {
    return ModelsTestOAuth2Response(
      accessToken: accessToken ?? this.accessToken,
      error: error ?? this.error,
      expiresAt: expiresAt ?? this.expiresAt,
      message: message ?? this.message,
      success: success ?? this.success,
      tokenType: tokenType ?? this.tokenType,
    );
  }
}

class ModelsUpdateCustomResponse {
  final String? body;
  final String? contentType;

  ModelsUpdateCustomResponse({this.body, this.contentType});

  factory ModelsUpdateCustomResponse.fromJson(Map<String, Object?> json) {
    return ModelsUpdateCustomResponse(
      body: json[r'body'] as String?,
      contentType: json[r'content_type'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var contentType = this.contentType;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body;
    }
    if (contentType != null) {
      json[r'content_type'] = contentType;
    }
    return json;
  }

  ModelsUpdateCustomResponse copyWith({String? body, String? contentType}) {
    return ModelsUpdateCustomResponse(
      body: body ?? this.body,
      contentType: contentType ?? this.contentType,
    );
  }
}

class ModelsUpdateEndpoint {
  /// Convoy supports two
  /// [signature formats](https://getconvoy.io/docs/product-manual/signatures)
  /// -- simple or advanced. If left unspecified, we default to false.
  final bool? advancedSignatures;

  /// This is used to define any custom authentication required by the endpoint.
  /// This
  /// shouldn't be needed often because webhook endpoints usually should be
  /// exposed to
  /// the internet.
  final ModelsEndpointAuthentication? authentication;

  /// Content type for the endpoint. Defaults to application/json if not
  /// specified.
  final String? contentType;

  /// Human-readable description of the endpoint. Think of this as metadata
  /// describing
  /// the endpoint
  final String? description;

  /// Define endpoint http timeout in seconds.
  final int? httpTimeout;

  /// This is used to manually enable/disable the endpoint.
  final bool? isDisabled;

  /// mTLS client certificate configuration for the endpoint
  final ModelsMtlsClientCert? mtlsClientCert;
  final String? name;

  /// The OwnerID is used to group more than one endpoint together to achieve
  /// [fanout](https://getconvoy.io/docs/manual/endpoints#Endpoint%20Owner%20ID)
  final String? ownerId;

  /// Rate limit is the total number of requests to be sent to an endpoint in
  /// the time duration specified in RateLimitDuration
  final int? rateLimit;

  /// Rate limit duration specifies the time range for the rate limit.
  final int? rateLimitDuration;

  /// Endpoint's webhook secret. If not provided, Convoy autogenerates one for
  /// the endpoint.
  final String? secret;

  /// Slack webhook URL is an alternative method to support email where endpoint
  /// developers
  /// can receive failure notifications on a slack channel.
  final String? slackWebhookUrl;

  /// Endpoint developers support email. This is used for communicating endpoint
  /// state
  /// changes. You should always turn this on when disabling endpoints are
  /// enabled.
  final String? supportEmail;

  /// URL is the endpoint's URL prefixed with https. non-https urls are
  /// currently
  /// not supported.
  final String? url;

  ModelsUpdateEndpoint({
    this.advancedSignatures,
    this.authentication,
    this.contentType,
    this.description,
    this.httpTimeout,
    this.isDisabled,
    this.mtlsClientCert,
    this.name,
    this.ownerId,
    this.rateLimit,
    this.rateLimitDuration,
    this.secret,
    this.slackWebhookUrl,
    this.supportEmail,
    this.url,
  });

  factory ModelsUpdateEndpoint.fromJson(Map<String, Object?> json) {
    return ModelsUpdateEndpoint(
      advancedSignatures: json[r'advanced_signatures'] as bool?,
      authentication: json[r'authentication'] != null
          ? ModelsEndpointAuthentication.fromJson(
              json[r'authentication']! as Map<String, Object?>,
            )
          : null,
      contentType: json[r'content_type'] as String?,
      description: json[r'description'] as String?,
      httpTimeout: (json[r'http_timeout'] as num?)?.toInt(),
      isDisabled: json[r'is_disabled'] as bool?,
      mtlsClientCert: json[r'mtls_client_cert'] != null
          ? ModelsMtlsClientCert.fromJson(
              json[r'mtls_client_cert']! as Map<String, Object?>,
            )
          : null,
      name: json[r'name'] as String?,
      ownerId: json[r'owner_id'] as String?,
      rateLimit: (json[r'rate_limit'] as num?)?.toInt(),
      rateLimitDuration: (json[r'rate_limit_duration'] as num?)?.toInt(),
      secret: json[r'secret'] as String?,
      slackWebhookUrl: json[r'slack_webhook_url'] as String?,
      supportEmail: json[r'support_email'] as String?,
      url: json[r'url'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var advancedSignatures = this.advancedSignatures;
    var authentication = this.authentication;
    var contentType = this.contentType;
    var description = this.description;
    var httpTimeout = this.httpTimeout;
    var isDisabled = this.isDisabled;
    var mtlsClientCert = this.mtlsClientCert;
    var name = this.name;
    var ownerId = this.ownerId;
    var rateLimit = this.rateLimit;
    var rateLimitDuration = this.rateLimitDuration;
    var secret = this.secret;
    var slackWebhookUrl = this.slackWebhookUrl;
    var supportEmail = this.supportEmail;
    var url = this.url;

    final json = <String, Object?>{};
    if (advancedSignatures != null) {
      json[r'advanced_signatures'] = advancedSignatures;
    }
    if (authentication != null) {
      json[r'authentication'] = authentication.toJson();
    }
    if (contentType != null) {
      json[r'content_type'] = contentType;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (httpTimeout != null) {
      json[r'http_timeout'] = httpTimeout;
    }
    if (isDisabled != null) {
      json[r'is_disabled'] = isDisabled;
    }
    if (mtlsClientCert != null) {
      json[r'mtls_client_cert'] = mtlsClientCert.toJson();
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (ownerId != null) {
      json[r'owner_id'] = ownerId;
    }
    if (rateLimit != null) {
      json[r'rate_limit'] = rateLimit;
    }
    if (rateLimitDuration != null) {
      json[r'rate_limit_duration'] = rateLimitDuration;
    }
    if (secret != null) {
      json[r'secret'] = secret;
    }
    if (slackWebhookUrl != null) {
      json[r'slack_webhook_url'] = slackWebhookUrl;
    }
    if (supportEmail != null) {
      json[r'support_email'] = supportEmail;
    }
    if (url != null) {
      json[r'url'] = url;
    }
    return json;
  }

  ModelsUpdateEndpoint copyWith({
    bool? advancedSignatures,
    ModelsEndpointAuthentication? authentication,
    String? contentType,
    String? description,
    int? httpTimeout,
    bool? isDisabled,
    ModelsMtlsClientCert? mtlsClientCert,
    String? name,
    String? ownerId,
    int? rateLimit,
    int? rateLimitDuration,
    String? secret,
    String? slackWebhookUrl,
    String? supportEmail,
    String? url,
  }) {
    return ModelsUpdateEndpoint(
      advancedSignatures: advancedSignatures ?? this.advancedSignatures,
      authentication: authentication ?? this.authentication,
      contentType: contentType ?? this.contentType,
      description: description ?? this.description,
      httpTimeout: httpTimeout ?? this.httpTimeout,
      isDisabled: isDisabled ?? this.isDisabled,
      mtlsClientCert: mtlsClientCert ?? this.mtlsClientCert,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      rateLimit: rateLimit ?? this.rateLimit,
      rateLimitDuration: rateLimitDuration ?? this.rateLimitDuration,
      secret: secret ?? this.secret,
      slackWebhookUrl: slackWebhookUrl ?? this.slackWebhookUrl,
      supportEmail: supportEmail ?? this.supportEmail,
      url: url ?? this.url,
    );
  }
}

class ModelsUpdateEventType {
  /// Category is a product-specific grouping for the event type
  final String? category;

  /// Description is used to describe what the event type does
  final String? description;

  /// JSONSchema is the JSON structure of the event type
  final Map<String, Object?>? jsonSchema;

  ModelsUpdateEventType({this.category, this.description, this.jsonSchema});

  factory ModelsUpdateEventType.fromJson(Map<String, Object?> json) {
    return ModelsUpdateEventType(
      category: json[r'category'] as String?,
      description: json[r'description'] as String?,
      jsonSchema: json[r'json_schema'] as Map<String, Object?>?,
    );
  }

  Map<String, Object?> toJson() {
    var category = this.category;
    var description = this.description;
    var jsonSchema = this.jsonSchema;

    final json = <String, Object?>{};
    if (category != null) {
      json[r'category'] = category;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (jsonSchema != null) {
      json[r'json_schema'] = jsonSchema;
    }
    return json;
  }

  ModelsUpdateEventType copyWith({
    String? category,
    String? description,
    Map<String, Object?>? jsonSchema,
  }) {
    return ModelsUpdateEventType(
      category: category ?? this.category,
      description: description ?? this.description,
      jsonSchema: jsonSchema ?? this.jsonSchema,
    );
  }
}

class ModelsUpdateFilterRequest {
  /// Body matching criteria (optional)
  final DatastoreM? body;

  /// Type of event this filter applies to (optional)
  final String? eventType;

  /// Header matching criteria (optional)
  final DatastoreM? headers;

  /// Whether the filter uses flattened JSON paths (optional)
  final bool? isFlattened;

  ModelsUpdateFilterRequest({
    this.body,
    this.eventType,
    this.headers,
    this.isFlattened,
  });

  factory ModelsUpdateFilterRequest.fromJson(Map<String, Object?> json) {
    return ModelsUpdateFilterRequest(
      body: json[r'body'] != null
          ? DatastoreM.fromJson(json[r'body']! as Map<String, Object?>)
          : null,
      eventType: json[r'event_type'] as String?,
      headers: json[r'headers'] != null
          ? DatastoreM.fromJson(json[r'headers']! as Map<String, Object?>)
          : null,
      isFlattened: json[r'is_flattened'] as bool?,
    );
  }

  Map<String, Object?> toJson() {
    var body = this.body;
    var eventType = this.eventType;
    var headers = this.headers;
    var isFlattened = this.isFlattened;

    final json = <String, Object?>{};
    if (body != null) {
      json[r'body'] = body.toJson();
    }
    if (eventType != null) {
      json[r'event_type'] = eventType;
    }
    if (headers != null) {
      json[r'headers'] = headers.toJson();
    }
    if (isFlattened != null) {
      json[r'is_flattened'] = isFlattened;
    }
    return json;
  }

  ModelsUpdateFilterRequest copyWith({
    DatastoreM? body,
    String? eventType,
    DatastoreM? headers,
    bool? isFlattened,
  }) {
    return ModelsUpdateFilterRequest(
      body: body ?? this.body,
      eventType: eventType ?? this.eventType,
      headers: headers ?? this.headers,
      isFlattened: isFlattened ?? this.isFlattened,
    );
  }
}

class ModelsUpdateSource {
  /// Function is a javascript function used to mutate the payload
  /// immediately after ingesting an event
  final String? bodyFunction;

  /// Custom response is used to define a custom response for incoming
  /// webhooks project sources only.
  final ModelsUpdateCustomResponse? customResponse;

  /// Soecfy header you want convoy to save from the ingest request and forward
  /// to your endpoints when the event is dispatched.
  final List<String>? forwardHeaders;

  /// Function is a javascript function used to mutate the headers
  /// immediately after ingesting an event
  final String? headerFunction;

  /// IdempotencyKeys are used to specify parts of a webhook request to uniquely
  /// identify the event in an incoming webhooks project.
  final List<String>? idempotencyKeys;

  /// This is used to manually enable/disable the source.
  final bool? isDisabled;

  /// Source name.
  final String? name;

  /// PubSub are used to specify message broker sources for outgoing
  /// webhooks projects, you only need to specify this when the source type is
  /// `pub_sub`.
  final ModelsPubSubConfig? pubSub;

  /// Source Type.
  final DatastoreSourceType? type;

  /// Verifiers are used to verify webhook events ingested in incoming
  /// webhooks projects.  If set, type is required and match the verifier
  /// type object you choose.
  final ModelsVerifierConfig? verifier;

  ModelsUpdateSource({
    this.bodyFunction,
    this.customResponse,
    this.forwardHeaders,
    this.headerFunction,
    this.idempotencyKeys,
    this.isDisabled,
    this.name,
    this.pubSub,
    this.type,
    this.verifier,
  });

  factory ModelsUpdateSource.fromJson(Map<String, Object?> json) {
    return ModelsUpdateSource(
      bodyFunction: json[r'body_function'] as String?,
      customResponse: json[r'custom_response'] != null
          ? ModelsUpdateCustomResponse.fromJson(
              json[r'custom_response']! as Map<String, Object?>,
            )
          : null,
      forwardHeaders: (json[r'forward_headers'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      headerFunction: json[r'header_function'] as String?,
      idempotencyKeys: (json[r'idempotency_keys'] as List<Object?>?)
          ?.map((i) => i as String? ?? '')
          .toList(),
      isDisabled: json[r'is_disabled'] as bool?,
      name: json[r'name'] as String?,
      pubSub: json[r'pub_sub'] != null
          ? ModelsPubSubConfig.fromJson(
              json[r'pub_sub']! as Map<String, Object?>,
            )
          : null,
      type: json[r'type'] != null
          ? DatastoreSourceType.fromValue(json[r'type']! as String)
          : null,
      verifier: json[r'verifier'] != null
          ? ModelsVerifierConfig.fromJson(
              json[r'verifier']! as Map<String, Object?>,
            )
          : null,
    );
  }

  Map<String, Object?> toJson() {
    var bodyFunction = this.bodyFunction;
    var customResponse = this.customResponse;
    var forwardHeaders = this.forwardHeaders;
    var headerFunction = this.headerFunction;
    var idempotencyKeys = this.idempotencyKeys;
    var isDisabled = this.isDisabled;
    var name = this.name;
    var pubSub = this.pubSub;
    var type = this.type;
    var verifier = this.verifier;

    final json = <String, Object?>{};
    if (bodyFunction != null) {
      json[r'body_function'] = bodyFunction;
    }
    if (customResponse != null) {
      json[r'custom_response'] = customResponse.toJson();
    }
    if (forwardHeaders != null) {
      json[r'forward_headers'] = forwardHeaders;
    }
    if (headerFunction != null) {
      json[r'header_function'] = headerFunction;
    }
    if (idempotencyKeys != null) {
      json[r'idempotency_keys'] = idempotencyKeys;
    }
    if (isDisabled != null) {
      json[r'is_disabled'] = isDisabled;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (pubSub != null) {
      json[r'pub_sub'] = pubSub.toJson();
    }
    if (type != null) {
      json[r'type'] = type.value;
    }
    if (verifier != null) {
      json[r'verifier'] = verifier.toJson();
    }
    return json;
  }

  ModelsUpdateSource copyWith({
    String? bodyFunction,
    ModelsUpdateCustomResponse? customResponse,
    List<String>? forwardHeaders,
    String? headerFunction,
    List<String>? idempotencyKeys,
    bool? isDisabled,
    String? name,
    ModelsPubSubConfig? pubSub,
    DatastoreSourceType? type,
    ModelsVerifierConfig? verifier,
  }) {
    return ModelsUpdateSource(
      bodyFunction: bodyFunction ?? this.bodyFunction,
      customResponse: customResponse ?? this.customResponse,
      forwardHeaders: forwardHeaders ?? this.forwardHeaders,
      headerFunction: headerFunction ?? this.headerFunction,
      idempotencyKeys: idempotencyKeys ?? this.idempotencyKeys,
      isDisabled: isDisabled ?? this.isDisabled,
      name: name ?? this.name,
      pubSub: pubSub ?? this.pubSub,
      type: type ?? this.type,
      verifier: verifier ?? this.verifier,
    );
  }
}

class ModelsUpdateSubscription {
  /// Alert configuration
  final ModelsAlertConfiguration? alertConfig;

  /// Deprecated but necessary for backward compatibility
  final String? appId;

  /// Delivery mode configuration
  final DatastoreDeliveryMode? deliveryMode;

  /// Destination endpoint ID
  final String? endpointId;

  /// Filter configuration
  final ModelsFilterConfiguration? filterConfig;

  /// Convoy supports mutating your request payload using a js function. Use
  /// this field
  /// to specify a `transform` function for this purpose. See
  /// this[https://docs.getconvoy.io/product-manual/subscriptions#functions] for
  /// more
  final String? function;

  /// Subscription Nme
  final String? name;

  /// Rate limit configuration
  final ModelsRateLimitConfiguration? rateLimitConfig;

  /// Retry configuration
  final ModelsRetryConfiguration? retryConfig;

  /// Source Id
  final String? sourceId;

  ModelsUpdateSubscription({
    this.alertConfig,
    this.appId,
    this.deliveryMode,
    this.endpointId,
    this.filterConfig,
    this.function,
    this.name,
    this.rateLimitConfig,
    this.retryConfig,
    this.sourceId,
  });

  factory ModelsUpdateSubscription.fromJson(Map<String, Object?> json) {
    return ModelsUpdateSubscription(
      alertConfig: json[r'alert_config'] != null
          ? ModelsAlertConfiguration.fromJson(
              json[r'alert_config']! as Map<String, Object?>,
            )
          : null,
      appId: json[r'app_id'] as String?,
      deliveryMode: json[r'delivery_mode'] != null
          ? DatastoreDeliveryMode.fromValue(json[r'delivery_mode']! as String)
          : null,
      endpointId: json[r'endpoint_id'] as String?,
      filterConfig: json[r'filter_config'] != null
          ? ModelsFilterConfiguration.fromJson(
              json[r'filter_config']! as Map<String, Object?>,
            )
          : null,
      function: json[r'function'] as String?,
      name: json[r'name'] as String?,
      rateLimitConfig: json[r'rate_limit_config'] != null
          ? ModelsRateLimitConfiguration.fromJson(
              json[r'rate_limit_config']! as Map<String, Object?>,
            )
          : null,
      retryConfig: json[r'retry_config'] != null
          ? ModelsRetryConfiguration.fromJson(
              json[r'retry_config']! as Map<String, Object?>,
            )
          : null,
      sourceId: json[r'source_id'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    var alertConfig = this.alertConfig;
    var appId = this.appId;
    var deliveryMode = this.deliveryMode;
    var endpointId = this.endpointId;
    var filterConfig = this.filterConfig;
    var function = this.function;
    var name = this.name;
    var rateLimitConfig = this.rateLimitConfig;
    var retryConfig = this.retryConfig;
    var sourceId = this.sourceId;

    final json = <String, Object?>{};
    if (alertConfig != null) {
      json[r'alert_config'] = alertConfig.toJson();
    }
    if (appId != null) {
      json[r'app_id'] = appId;
    }
    if (deliveryMode != null) {
      json[r'delivery_mode'] = deliveryMode.value;
    }
    if (endpointId != null) {
      json[r'endpoint_id'] = endpointId;
    }
    if (filterConfig != null) {
      json[r'filter_config'] = filterConfig.toJson();
    }
    if (function != null) {
      json[r'function'] = function;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (rateLimitConfig != null) {
      json[r'rate_limit_config'] = rateLimitConfig.toJson();
    }
    if (retryConfig != null) {
      json[r'retry_config'] = retryConfig.toJson();
    }
    if (sourceId != null) {
      json[r'source_id'] = sourceId;
    }
    return json;
  }

  ModelsUpdateSubscription copyWith({
    ModelsAlertConfiguration? alertConfig,
    String? appId,
    DatastoreDeliveryMode? deliveryMode,
    String? endpointId,
    ModelsFilterConfiguration? filterConfig,
    String? function,
    String? name,
    ModelsRateLimitConfiguration? rateLimitConfig,
    ModelsRetryConfiguration? retryConfig,
    String? sourceId,
  }) {
    return ModelsUpdateSubscription(
      alertConfig: alertConfig ?? this.alertConfig,
      appId: appId ?? this.appId,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      endpointId: endpointId ?? this.endpointId,
      filterConfig: filterConfig ?? this.filterConfig,
      function: function ?? this.function,
      name: name ?? this.name,
      rateLimitConfig: rateLimitConfig ?? this.rateLimitConfig,
      retryConfig: retryConfig ?? this.retryConfig,
      sourceId: sourceId ?? this.sourceId,
    );
  }
}

class ModelsVerifierConfig {
  final ModelsApiKey? apiKey;
  final ModelsBasicAuth? basicAuth;
  final ModelsHMac? hmac;
  final DatastoreVerifierType type;

  ModelsVerifierConfig({
    this.apiKey,
    this.basicAuth,
    this.hmac,
    required this.type,
  });

  factory ModelsVerifierConfig.fromJson(Map<String, Object?> json) {
    return ModelsVerifierConfig(
      apiKey: json[r'api_key'] != null
          ? ModelsApiKey.fromJson(json[r'api_key']! as Map<String, Object?>)
          : null,
      basicAuth: json[r'basic_auth'] != null
          ? ModelsBasicAuth.fromJson(
              json[r'basic_auth']! as Map<String, Object?>,
            )
          : null,
      hmac: json[r'hmac'] != null
          ? ModelsHMac.fromJson(json[r'hmac']! as Map<String, Object?>)
          : null,
      type: DatastoreVerifierType.fromValue(json[r'type'] as String? ?? ''),
    );
  }

  Map<String, Object?> toJson() {
    var apiKey = this.apiKey;
    var basicAuth = this.basicAuth;
    var hmac = this.hmac;
    var type = this.type;

    final json = <String, Object?>{};
    if (apiKey != null) {
      json[r'api_key'] = apiKey.toJson();
    }
    if (basicAuth != null) {
      json[r'basic_auth'] = basicAuth.toJson();
    }
    if (hmac != null) {
      json[r'hmac'] = hmac.toJson();
    }
    json[r'type'] = type.value;
    return json;
  }

  ModelsVerifierConfig copyWith({
    ModelsApiKey? apiKey,
    ModelsBasicAuth? basicAuth,
    ModelsHMac? hmac,
    DatastoreVerifierType? type,
  }) {
    return ModelsVerifierConfig(
      apiKey: apiKey ?? this.apiKey,
      basicAuth: basicAuth ?? this.basicAuth,
      hmac: hmac ?? this.hmac,
      type: type ?? this.type,
    );
  }
}

class UtilServerResponse {
  final String? message;
  final bool? status;

  UtilServerResponse({this.message, this.status});

  factory UtilServerResponse.fromJson(Map<String, Object?> json) {
    return UtilServerResponse(
      message: json[r'message'] as String?,
      status: json[r'status'] as bool?,
    );
  }

  Map<String, Object?> toJson() {
    var message = this.message;
    var status = this.status;

    final json = <String, Object?>{};
    if (message != null) {
      json[r'message'] = message;
    }
    if (status != null) {
      json[r'status'] = status;
    }
    return json;
  }

  UtilServerResponse copyWith({String? message, bool? status}) {
    return UtilServerResponse(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
