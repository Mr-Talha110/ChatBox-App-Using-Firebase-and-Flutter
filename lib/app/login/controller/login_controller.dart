// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../dashboard/views/dashboardScreen.dart';
import '../../signup/views/signup_screen.dart';
import '../views/forgot_password_screen.dart';

class LoginController extends GetxController {
  gotoforgotpasswordscreen() {
    Get.to(const ForgetPasswordScreen());
  }

  login(dynamic loginEmailController, dynamic loginPasswordController) async {
    var loginEmail = loginEmailController.text.trim();
    var loginPassword = loginPasswordController.text.trim();
    try {
      final User? firebaseUser = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: loginEmail, password: loginPassword))
          .user;
      if (firebaseUser != null) {
        Get.offAll(const DashboardScreen());
      } else {
        print('Cannot login at that time. Please check email and password');
      }
    } on FirebaseAuthException catch (e) {
      print('Eror login $e');
    }
  }

  gotosignupscreen() {
    Get.to(const SingupScreen());
  }
}