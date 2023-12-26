// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_app/app/dashboard/views/dashboardScreen.dart';
import 'package:note_app/utils/popups.dart';

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
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: loginEmail, password: loginPassword)
        .then((value) {
      Get.to(const DashboardScreen());
      isLoading.value = false;
    }).onError((error, stackTrace) {
      PopUps().showErorr(error.toString());
      isLoading.value = false;
    });
  }

  gotosignupscreen() {
    Get.to(const SingupScreen());
  }
}
