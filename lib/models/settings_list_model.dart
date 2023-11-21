import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsListModel extends GetxController {
  final String image;
  final String title;
  final String subTitle;
  final Widget screenName;
  SettingsListModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.screenName,
  });
}
