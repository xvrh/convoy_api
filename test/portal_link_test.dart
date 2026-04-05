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

  test('Create portal link for an owner, return dashboard URL',
      skip: 'Portal Links is gated by Convoy license entitlements. The OSS '
          'community build hard-codes PortalLinks()=false in its licenser '
          '(internal/pkg/license/service/licenser.go → hasFeature), so '
          'POST /portal-links returns 401 "Access denied" via '
          'RequireValidPortalLinksLicense middleware regardless of API key. '
          "Unskip this test when running against a licensed Convoy instance "
          '(Convoy Cloud or self-hosted with an entitled license).',
      () async {
    // Create an endpoint tagged with an owner_id so the portal link can
    // inherit the endpoints matching that owner.
    final ownerId = 'customer-${randomName('owner')}';
    await api.createEndpoint(
      projectId: projectId,
      body: ModelsCreateEndpoint(
        name: randomName('portal-ep'),
        url: 'http://$hostFromDocker:65535/hook',
        ownerId: ownerId,
      ),
    );

    // Create a portal link by owner_id — this is the URL we hand to the
    // customer so they can manage their own endpoints.
    final created = await api.createPortalLink(
      projectId: projectId,
      body: DatastoreCreatePortalLinkRequest(
        name: randomName('portal'),
        ownerId: ownerId,
        canManageEndpoint: true,
      ),
    );
    final data = ((created as Map)['data'] as Map);
    final portalLinkId = data['uid'] as String;
    final dashboardUrl = data['url'] as String;

    expect(portalLinkId, isNotEmpty);
    expect(dashboardUrl, isNotEmpty);
    expect(dashboardUrl, contains('/portal'));
    expect(data['owner_id'], ownerId);
    expect(data['can_manage_endpoint'], isTrue);

    // Round-trip: getPortalLink should return the same link.
    final fetched = await api.getPortalLink(
      projectId: projectId,
      portalLinkId: portalLinkId,
    );
    expect(((fetched as Map)['data'] as Map)['uid'], portalLinkId);

    // Cleanup: revoke it so leftover state doesn't accumulate.
    await api.revokePortalLink(
      projectId: projectId,
      portalLinkId: portalLinkId,
    );
  });
}
