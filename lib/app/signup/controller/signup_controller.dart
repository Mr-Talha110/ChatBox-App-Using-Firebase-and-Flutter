// ignore_for_file: avoid_print, body_might_complete_normally_catch_error

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../services/auth.dart';

class SignupController extends GetxController {
  final controller = Get.put(Auth());
  signup(userNameController, userPhoneController, userEmailController,
      userPasswordController, nameController) async {
    var userName = userNameController.text.trim();
    var userPhone = userPhoneController.text.trim();
    var userEmail = userEmailController.text.trim();
    var userPassword = userPasswordController.text.trim();
    var name = nameController.text.trim();

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userEmail, password: userPassword)
        .then((value) => {
              print('User created'),
              controller.signUpUser(
                  userName, userPhone, userEmail, userPassword, name),
            })
        .catchError((error) {
      print('Error occurred during user creation $error');
    });
  }

  goBack() {
    Get.back();
  }
}
