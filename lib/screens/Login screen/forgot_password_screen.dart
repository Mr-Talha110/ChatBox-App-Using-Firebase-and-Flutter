// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/utils/constants.dart';
import 'package:note_app/utils/strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController forgotPasswordController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(children: [
            const SizedBox(height: 50),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.forgotPassword,
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0.02,
                  letterSpacing: -0.35,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.forgotDescp,
                style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.18,
                ),
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              cursorColor: AppColors.greenColor,
              controller: forgotPasswordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: AppColors.greenColor,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide:
                        BorderSide(color: AppColors.greenColor, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide:
                        BorderSide(color: AppColors.greenColor, width: 1.5)),
                hintText: AppStrings.email,
                hintStyle: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.18,
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () async {
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
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  AppStrings.submit,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
