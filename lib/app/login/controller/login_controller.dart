// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_app/app/login/views/login_screen.dart';

import '../../dashboard/views/dashboardScreen.dart';
import '../../signup/views/signup_screen.dart';
import '../views/forgot_password_screen.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool showPassword = false.obs;
  hidePassword() {
    showPassword.value = !showPassword.value;
  }

  gotoforgotpasswordscreen() {
    Get.to(const ForgetPasswordScreen());
  }

  login(dynamic loginEmailController, dynamic loginPasswordController) async {
    isLoading.value = true;
    var loginEmail = loginEmailController.text.trim();
    var loginPassword = loginPasswordController.text.trim();
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: loginEmail, password: loginPassword)
        .then((value) {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAll(const DashboardScreen());
        isLoading.value = false;
      } else {
        Get.offAll(const LoginScreen());
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      print(error);
    });
  }

  gotosignupscreen() {
    Get.to(const SingupScreen());
  }
}
