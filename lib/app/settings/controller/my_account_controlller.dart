import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/utils/popups.dart';

import '../../login/views/login_screen.dart';

class MyAccountController extends GetxController {
  final picker = ImagePicker();
  goBack() {
    Get.back();
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(const LoginScreen());
  }

  Future getImage() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedImage != null) {
      // LocalData().setUserData(pickedImage.path);
    } else {
      PopUps().showErorr('Image not Picked');
    }
  }
}
