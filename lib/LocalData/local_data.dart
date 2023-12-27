import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../models/user_model.dart';

class LocalData {
  static const String userModelKey = 'UserModelKey';
  // *********************Save user data*****************************
  setUserData(imageUrl) async {
    AppManager.userModel = UserModel(imageUrl: imageUrl);

    SharedPreferences sp = await SharedPreferences.getInstance();

    await sp.setString(
        userModelKey, jsonEncode(AppManager.userModel!.toJson()));
  }
}
