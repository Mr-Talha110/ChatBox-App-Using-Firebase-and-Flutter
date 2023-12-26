// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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
    try {
      final User? firebaseUser = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: loginEmail, password: loginPassword))
          .user;
      if (firebaseUser != null) {
        isLoading.value = false;
        Get.offAll(const DashboardScreen());
      } else {
        isLoading.value = false;

        print('Cannot login at that time. Please check email and password');
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;

      print('Eror login $e');
    }
  }

  gotosignupscreen() {
    Get.to(const SingupScreen());
  }
}
