import 'package:get/get.dart';
import 'package:note_app/models/settings_list_model.dart';

class SettingsListController extends GetxController {
  final List _list = <SettingsListModel>[
    SettingsListModel(
        image: 'assets/images/key.svg',
        title: 'Account',
        subTitle: 'Privacy, security, change number'),
    SettingsListModel(
        image: 'assets/images/chat.svg',
        title: 'Chat',
        subTitle: 'Chat history,theme,wallpapers'),
    SettingsListModel(
        image: 'assets/images/notifications.svg',
        title: 'Notifications',
        subTitle: 'Messages, group and others'),
    SettingsListModel(
        image: 'assets/images/help.svg',
        title: 'Help',
        subTitle: 'Help center,contact us, privacy policy'),
    SettingsListModel(
        image: 'assets/images/data.svg',
        title: 'Storage and data',
        subTitle: 'Network usage, stogare usage'),
    SettingsListModel(
        image: 'assets/images/contact.svg',
        title: 'Invite a friend',
        subTitle: 'subTitle'),
  ];
  List<SettingsListModel> get lists {
    return [..._list];
  }
}
