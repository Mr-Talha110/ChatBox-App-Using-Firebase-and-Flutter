import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/screens/Save%20notes%20screens/create_note_screen.dart';

import '../Login screen/login_screen.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff24786D),
        onPressed: () {
          Get.to(const CreateNoteScreen());
        },
        child: const Icon(
          Icons.note_alt_sharp,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff24786D),
        actions: [
          const Text(
            'Logout',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAll(const LoginScreen());
            },
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: const Center(
        child: Text('Message screen'),
      ),
    );
  }
}
