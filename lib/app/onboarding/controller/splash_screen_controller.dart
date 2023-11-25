import 'package:get/get.dart';

import '../../login/views/login_screen.dart';

class SplashScreenController extends GetxController {
  gotologinscreen() {
    Get.offAll(const LoginScreen());
  }
}
