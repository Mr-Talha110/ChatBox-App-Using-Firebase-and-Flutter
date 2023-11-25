// ignore_for_file: avoid_print, body_might_complete_normally_catch_error

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/login/controller/login_controller.dart';
import 'package:note_app/app/signup/controller/signup_controller.dart';
import 'package:note_app/utils/strings.dart';
import '../../../utils/constants.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final loginController = Get.put(LoginController());
  final controller = Get.put(SignupController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          forceMaterialTransparency: true,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.backgroundColor),
          backgroundColor: AppColors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.register,
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
                  AppStrings.registerDescp,
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
                controller: nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
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
                  hintText: AppStrings.name,
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
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: AppColors.greenColor,
                controller: userNameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.house_rounded,
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
                  hintText: AppStrings.userName,
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
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: AppColors.greenColor,
                controller: userPhoneController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
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
                  hintText: AppStrings.phone,
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
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: AppColors.greenColor,
                controller: userEmailController,
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
              const SizedBox(height: 10),
              Obx(
                () => TextFormField(
                  obscureText: !loginController.showPassword.value,
                  cursorColor: AppColors.greenColor,
                  controller: userPasswordController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.greenColor,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              color: AppColors.greenColor, width: 1.5)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              color: AppColors.greenColor, width: 1.5)),
                      hintText: AppStrings.password,
                      hintStyle: const TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.09,
                        letterSpacing: -0.18,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            loginController.hidePassword();
                          },
                          icon: loginController.showPassword.value
                              ? const Icon(Icons.visibility_off,
                                  color: AppColors.greenColor)
                              : const Icon(Icons.visibility,
                                  color: AppColors.greenColor))),
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  controller.signup(
                      userNameController,
                      userPhoneController,
                      userEmailController,
                      userPasswordController,
                      nameController);
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
                    AppStrings.register,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.haveAccount,
                    style: TextStyle(
                      color: AppColors.backgroundColor,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      controller.goBack();
                    },
                    child: const Text(
                      AppStrings.login,
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.greenColor,
                        height: 0,
                        letterSpacing: -0.18,
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
