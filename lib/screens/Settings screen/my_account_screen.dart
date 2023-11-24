import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Widgets/my_info.dart';
import '../Login screen/login_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000E08),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          const Text(
            'Sign out',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(const LoginScreen());
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Image.asset(
              'assets/images/person.png',
              width: 82,
            ),
            const SizedBox(height: 10),
            const Text("Nazrul Islam",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const SizedBox(height: 8),
            const Text("@jhonabraham",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff797C7B))),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/images/message.svg',
                  width: 50,
                ),
                SvgPicture.asset(
                  'assets/images/videocall.svg',
                  width: 50,
                ),
                SvgPicture.asset(
                  'assets/images/voicecall.svg',
                  width: 50,
                ),
                SvgPicture.asset(
                  'assets/images/options.svg',
                  width: 50,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const MyInfo(),
          ],
        ),
      ),
    );
  }
}
