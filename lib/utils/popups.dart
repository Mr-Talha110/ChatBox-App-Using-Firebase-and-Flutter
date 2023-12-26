import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/utils/constants.dart';

class PopUps {
  void showErorr(message) {
    Get.snackbar('', message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppColors.white,
        backgroundColor: AppColors.greenColor,
        margin: const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 0),
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30));
  }
}
