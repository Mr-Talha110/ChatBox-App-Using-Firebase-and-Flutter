// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController forgotPasswordController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.red,
          title: const Text(
            'Firebase App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(children: [
            const SizedBox(height: 50),
            const Text(
              'Forgot Password',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                controller: forgotPasswordController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already know my password?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () async {
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
                },
                child: const Text(
                  'Forgot',
                  style: TextStyle(color: Colors.white),
                ))
          ]),
        ));
  }
}
