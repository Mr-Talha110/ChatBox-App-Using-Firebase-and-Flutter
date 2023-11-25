// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  forgotPassword(dynamic forgotPasswordController) async {
    var forgotEmail = forgotPasswordController.text.trim();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgotEmail)
          .then((value) {
        print('Email sent');
        Get.back();
      });
    } on FirebaseAuthException catch (e) {
      print('Eror is $e');
    }
  }
}
