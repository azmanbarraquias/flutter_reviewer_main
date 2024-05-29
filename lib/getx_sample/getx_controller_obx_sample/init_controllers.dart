import 'package:get/get.dart';

import 'contollers/tap_getx_controller.dart';

Future<void> init() async {
  // Get.put(TapGetXController());
  Get.lazyPut(() => TapGetXController());
}
