

import 'package:get/get.dart';

class GetXController extends GetxController {

  RxInt countObs = 0.obs;

}

Future<void> init() async {
  // Get.put(TapGetXController());
  Get.lazyPut(() => GetXController());
}

class InitDep implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetXController());
  }
}
