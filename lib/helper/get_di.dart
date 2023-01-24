import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/profile_screen_controller.dart';
import '../controller/theme_controller.dart';

Future<dynamic> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => ProfileController());

}
