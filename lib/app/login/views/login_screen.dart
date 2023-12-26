// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/login/controller/login_controller.dart';
import 'package:note_app/utils/constants.dart';
import 'package:note_app/utils/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(children: [
          const SizedBox(height: 140),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login',
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
              AppStrings.loginDescp,
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
          const SizedBox(height: 40),
          TextFormField(
            cursorColor: AppColors.greenColor,
            controller: loginEmailController,
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
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => TextFormField(
              obscureText: !controller.showPassword.value,
              cursorColor: AppColors.greenColor,
              controller: loginPasswordController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: AppColors.greenColor,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: AppColors.greenColor, width: 1.5)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: AppColors.greenColor, width: 1.5)),
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
                        controller.hidePassword();
                      },
                      icon: controller.showPassword.value
                          ? const Icon(
                              Icons.visibility_off,
                              color: AppColors.greenColor,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: AppColors.greenColor,
                            ))),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {
                  controller.gotoforgotpasswordscreen();
                },
                child: const Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.greenColor,
                    height: 0.17,
                    letterSpacing: -0.13,
                  ),
                )),
          ),
          const SizedBox(height: 28),
          InkWell(
            onTap: () {
              controller.login(loginEmailController, loginPasswordController);
            },
            child: Obx(
              () => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: AppColors.white,
                      )
                    : const Text(
                        AppStrings.login,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: AppColors.backgroundColor, thickness: 1.5),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                border:
                    Border.all(color: AppColors.backgroundColor, width: 1.5),
                borderRadius: BorderRadius.circular(16)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                AssetRef.google,
                width: 24,
              ),
              const SizedBox(width: 10),
              const Text(
                AppStrings.continueWithGoogle,
                style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  letterSpacing: -0.18,
                ),
              )
            ]),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.dontHaveAccount,
                style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.18,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  controller.gotosignupscreen();
                },
                child: const Text(
                  AppStrings.register,
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
          const SizedBox(height: 30),
        ]),
      ),
    ));
  }
}
