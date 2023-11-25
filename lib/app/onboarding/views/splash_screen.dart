import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/onboarding/controller/splash_screen_controller.dart';
import 'package:note_app/utils/strings.dart';

import '../../../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(24),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            AppStrings.welcomeTo,
            style: TextStyle(
              color: AppColors.backgroundColor,
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.26,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            AppStrings.chatBox,
            style: TextStyle(
              color: AppColors.greenColor,
              fontSize: 40,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: -0.44,
            ),
          ),
        ),
        const Text(
          AppStrings.welcomeScreenDescp,
          style: TextStyle(
            color: AppColors.backgroundColor,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: -0.18,
          ),
        ),
        const SizedBox(height: 50),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.backgroundColor, width: 1.5),
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.backgroundColor, width: 1.5),
              borderRadius: BorderRadius.circular(16)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              AppStrings.continueWithEmail,
              style: TextStyle(
                color: AppColors.backgroundColor,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0.09,
                letterSpacing: -0.18,
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              AssetRef.atLogo,
              color: AppColors.greenColor,
              width: 24,
            ),
          ]),
        ),
        const SizedBox(height: 25),
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
                controller.gotologinscreen();
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
    ));
  }
}
