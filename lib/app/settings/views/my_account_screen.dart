import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/app/settings/controller/my_account_controlller.dart';
import 'package:note_app/utils/strings.dart';

import '../../../widgets/my_info.dart';
import '../../../utils/constants.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final controller = Get.put(MyAccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: IconButton(
            onPressed: () {
              controller.goBack();
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
              onPressed: () {
                controller.signout();
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