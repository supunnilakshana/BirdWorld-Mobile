import 'package:birdworld/ui/views/auth/reset_password/view.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get_it/get_it.dart';

import 'package:stacked_services/stacked_services.dart';

class DynamicLinkService {
  final NavigationService _navigationService = GetIt.I.get();
  initLink() async {
    print("object");
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    handeleLink(initialLink);

    FirebaseDynamicLinks.instance.onLink.listen(
      (pendingDynamicLinkData) {
        print(pendingDynamicLinkData.link.data);
        handeleLink(pendingDynamicLinkData);
      },
    );
  }

  void handeleLink(PendingDynamicLinkData? initialLink) {
    print(initialLink);
    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      _navigationService.clearStackAndShowView(ResetPasswordView(deepLink));
    }
  }
}
