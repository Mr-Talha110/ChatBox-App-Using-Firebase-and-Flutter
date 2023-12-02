import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../dashboard/views/dashboardScreen.dart';
import '../../login/views/login_screen.dart';
import '../views/welcome_screen.dart';

class OnboardingScreensController extends GetxController {
  User? user;

  gotologinscreen() {
    Get.offAll(const LoginScreen());
  }

  splashnavigator() {
    user = FirebaseAuth.instance.currentUser;

    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(
          user != null ? const DashboardScreen() : const WelcomeScreen());
    });
  }
}
