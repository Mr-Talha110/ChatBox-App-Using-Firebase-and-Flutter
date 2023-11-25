// ignore_for_file: file_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth extends GetxController {
  signUpUser(String userName, String userPhone, String userEmail,
      String userPassword, String name) async {
    User? userId = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId!.uid)
          .set({
        'username': userName,
        'userPhone': userPhone,
        'userEmail': userEmail,
        'createdDate': DateTime.now(),
        'password': userPassword,
        'userId': userId.uid,
        'name': name,
      }).then((value) {
        FirebaseAuth.instance.signOut();
        Get.back();
      }).catchError((error) {
        print('error occured during data storing $error');
      });
    } on FirebaseAuthException catch (e) {
      print('Error occured $e');
    }
  }
}
