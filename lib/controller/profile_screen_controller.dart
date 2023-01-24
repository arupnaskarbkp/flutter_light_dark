import 'package:get/get.dart';
import 'theme_controller.dart';

class ProfileController extends GetxController implements GetxService {

  ///Change theme..
  bool _isSwitched = Get.find<ThemeController>().darkTheme;

  bool get isSwitched => _isSwitched;

  void toggleSwitch(bool value) {
    if (_isSwitched == false) {
      _isSwitched = true;

      Get.find<ThemeController>().toggleTheme();
      update();

    } else {
      _isSwitched = false;
      Get.find<ThemeController>().toggleTheme();
      update();
    }
  }
}
