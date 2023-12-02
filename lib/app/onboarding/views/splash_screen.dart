import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/onboarding/controller/onboarding_screens_controller.dart';
import 'package:note_app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(OnboardingScreensController());

  @override
  void initState() {
    controller.splashnavigator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          AssetRef.splashLogo,
          width: 154,
        ),
      ),
    );
  }
}
