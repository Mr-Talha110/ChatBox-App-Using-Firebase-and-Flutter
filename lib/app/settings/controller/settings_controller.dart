import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app/models/settings_list_model.dart';
import 'package:note_app/app/settings/views/my_account_screen.dart';

import '../../../utils/constants.dart';

class SettingsController extends GetxController {
  final List _list = <SettingsListModel>[
    SettingsListModel(
        screenName: const MyAccountScreen(),
        image: 'assets/images/key.svg',
        title: 'Account',
        subTitle: 'Privacy, security, change number'),
    SettingsListModel(
        screenName: const MyAccountScreen(),
        image: 'assets/images/chat.svg',
        title: 'Chat',
        subTitle: 'Chat history,theme,wallpapers'),
    SettingsListModel(
        screenName: const MyAccountScreen(),
        image: 'assets/images/notifications.svg',
        title: 'Notifications',
        subTitle: 'Messages, group and others'),
    SettingsListModel(
        screenName: const MyAccountScreen(),
        image: 'assets/images/help.svg',
        title: 'Help',
        subTitle: 'Help center,contact us, privacy policy'),
    SettingsListModel(
        screenName: const MyAccountScreen(),
        image: 'assets/images/data.svg',
        title: 'Storage and data',
        subTitle: 'Network usage, stogare usage'),
    SettingsListModel(
        screenName: const MyAccountScreen(),
        image: 'assets/images/contact.svg',
        title: 'Invite a friend',
        subTitle: ''),
  ];
  List<SettingsListModel> get lists {
    return [..._list];
  }

  showQr() {
    Get.dialog(Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetRef.qrCode,
            width: 250,
          )
        ],
      ),
    ));
  }
}
