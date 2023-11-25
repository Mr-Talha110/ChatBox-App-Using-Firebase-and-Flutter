import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/utils/strings.dart';

import '../../Widgets/my_info.dart';
import '../../utils/constants.dart';
import '../Login screen/login_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            )),
        actions: [
          const Text(
            AppStrings.signOut,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(const LoginScreen());
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: AppColors.white,
              ))
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Image.asset(
              AssetRef.user,
              width: 82,
            ),
            const SizedBox(height: 10),
            const Text("Nazrul Islam",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white)),
            const SizedBox(height: 8),
            const Text("@jhonabraham",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AssetRef.messageIcon,
                  width: 50,
                ),
                SvgPicture.asset(
                  AssetRef.videoCallICon,
                  width: 50,
                ),
                SvgPicture.asset(
                  AssetRef.voiceCallIcon,
                  width: 50,
                ),
                SvgPicture.asset(
                  AssetRef.optionIcon,
                  width: 50,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const MyInfo(),
          ],
        ),
      ),
    );
  }
}
