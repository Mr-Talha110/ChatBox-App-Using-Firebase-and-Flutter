import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/settings_list_controller.dart';

import '../utils/constants.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsList = Get.put(SettingsListController()).lists;
    return Expanded(
      child: ListView.builder(
          itemCount: settingsList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(settingsList[index].screenName);
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        settingsList[index].image,
                        width: 44,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(settingsList[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                          Text(settingsList[index].subTitle,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyColor))
                        ],
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
