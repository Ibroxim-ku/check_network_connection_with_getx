import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetController extends GetxController {
  RxBool isConnectedToInternet = false.obs;

  late StreamSubscription _internetConnectionStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          isConnectedToInternet.value = true;
          break;
        case InternetStatus.disconnected:
          isConnectedToInternet.value = false;
          break;
        default:
          isConnectedToInternet.value = false;
          break;
      }
    });
  }

  @override
  void onClose() {
    _internetConnectionStreamSubscription.cancel();
    super.onClose();
  }
}
