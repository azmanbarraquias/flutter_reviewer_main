import 'package:get/get.dart';

import '../../../x_experiment/flutter_lifecycle.dart';
import '../pages/second_page.dart';

class TapGetXController extends GetxController {
  int _xSimple = 0;

  int get x => _xSimple;

  RxInt countObs = 0.obs;

  void increaseX() {
    _xSimple++;
    update(); // required to see the changes
    xPrint(_xSimple);
  }

  void decreaseX() {
    _xSimple--;
    update(); // required to see the changes
    xPrint(_xSimple);
  }

  void increaseXObs() {
    countObs.value++;
    xPrint(countObs);
  }

  void decreaseXObs() {
    countObs.value--;
    xPrint(countObs);
  }

  void goToSecondPage() {
    Get.to(() => const SecondPage());
  }
}
