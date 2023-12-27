import 'package:flutter/material.dart';
import 'package:note_app/models/user_model.dart';

class AppColors {
  static const Color backgroundColor = Color(0xff000E08);
  static const Color white = Colors.white;
  static const Color greenColor = Color(0xff24786D);
  static const Color greyColor = Color(0xff797C7B);
  static const Color neon = Color(0xff0FE16D);
  static const Color transparent = Colors.transparent;
  static const Color redAlert = Color(0xffEA3736);
  static const Color greish = Color(0xff9A9E9C);
  static const Color lightGreen = Color(0xff20A090);
  static const Color lightGrey = Color(0xFFC7C7C7);
  static const Color dotGrey = Color(0xffE6E6E6);
  static const Color fieldColor = Color(0xfff3f6f6);
}

class AssetRef {
  static const String receiveCall = 'assets/images/receivecall.svg';
  static const String madeCall = 'assets/images/madecall.svg';
  static const String phone = 'assets/images/Call.svg';
  static const String videoCall = 'assets/images/Video.svg';
  static const String text = 'assets/images/text.svg';
  static const String contact = 'assets/images/user.svg';
  static const String settings = 'assets/images/settings.svg';
  static const String google = 'assets/images/google.png';
  static const String backArrow = 'assets/images/Back.svg';
  static const String user = 'assets/images/me.png';
  static const String files = 'assets/images/files.svg';
  static const String camera = 'assets/images/camera.svg';
  static const String microphone = 'assets/images/microphone.svg';
  static const String docs = 'assets/images/doc.svg';
  static const String bell = 'assets/images/bell.svg';
  static const String bin = 'assets/images/trash.svg';
  static const String messageIcon = 'assets/images/message.svg';
  static const String videoCallICon = 'assets/images/videocall.svg';
  static const String voiceCallIcon = 'assets/images/voicecall.svg';
  static const String optionIcon = 'assets/images/options.svg';
  static const String qrCode = 'assets/images/qr.png';
  static const String qrCodeIcon = 'assets/images/qr.svg';
  static const String cameraIcon = 'assets/images/cameraIcon.svg';
  static const String contactIcon = 'assets/images/contactIcon.svg';
  static const String docsIcon = 'assets/images/docsIcon.svg';
  static const String locationIcon = 'assets/images/locationIcon.svg';
  static const String picsIcon = 'assets/images/picsIcon.svg';
  static const String pollIcon = 'assets/images/pollIcon.svg';
  static const String atLogo = 'assets/images/at.png';
  static const String splashLogo = 'assets/images/mainlogo.png';
  static const String imagePicker = 'assets/images/camera.png';
}

class AppManager {
  static UserModel? userModel;
}
