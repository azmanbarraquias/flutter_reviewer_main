import 'package:get/get.dart';

import '../contollers/tap_getx_controller.dart';

class InitDep implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TapGetXController());
  }
}
