import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/app/settings/controller/my_account_controlller.dart';
import 'package:note_app/utils/strings.dart';
import '../../../models/user_model.dart';
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
          icon: SvgPicture.asset(
            AssetRef.backArrow,
            colorFilter:
                const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
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
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.white,
              ));
            }
            final userModel = UserModel(
              name: snapshot.data!['name'],
              userName: snapshot.data!['username'],
              userEmail: snapshot.data!['userEmail'],
              userPhone: snapshot.data!['userPhone'],
            );
            return Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 82,
                        height: 82,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(41),
                          child: Image.asset(
                            AssetRef.user,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            await controller.getImage();
                            setState(() {});
                          },
                          child: Image.asset(
                            AssetRef.imagePicker,
                            width: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(snapshot.data!['name'],
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white)),
                  const SizedBox(height: 8),
                  Text('@${snapshot.data!['username']}',
                      style: const TextStyle(
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
                  MyInfo(userModel: userModel),
                ],
              ),
            );
          }),
    );
  }
}
