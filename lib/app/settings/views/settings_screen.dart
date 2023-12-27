import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/app/settings/controller/settings_controller.dart';
import 'package:note_app/utils/strings.dart';

import '../../../widgets/settings_list.dart';
import '../../../utils/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.white),
        backgroundColor: AppColors.transparent,
        title: const Text(
          AppStrings.settings,
        ),
      ),
      body: Column(children: [
        const SizedBox(height: 60),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(children: [
              Container(
                  width: 30,
                  height: 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.dotGrey)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            AppManager.userModel == null
                                ? AssetRef.user
                                : AppManager.userModel!.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nazrul Islam",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                          Text("Never give up 💪",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      controller.showQr();
                    },
                    child: SvgPicture.asset(
                      AssetRef.qrCodeIcon,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Divider(color: AppColors.white),
              const SizedBox(height: 20),
              const SettingsList(),
            ]),
          ),
        )
      ]),
    );
  }
}
