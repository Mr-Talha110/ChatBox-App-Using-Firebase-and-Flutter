import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

signUpUser(String userName, String userPhone, String userEmail,
    String userPassword) async {
  User? userId = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance.collection('users').doc(userId!.uid).set({
      'username': userName,
      'userPhone': userPhone,
      'userEmail': userEmail,
      'createdDate': DateTime.now(),
      'password': userPassword,
      'userId': userId.uid
    }).then((value) {
      FirebaseAuth.instance.signOut();
      Get.back();
    }).catchError((error) {
      // ignore: avoid_print
      print('error occured during data storing $error');
    });
  } on FirebaseAuthException catch (e) {
    print('Error occured $e');
  }
}