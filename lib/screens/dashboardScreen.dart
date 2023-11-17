// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/screens/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? user = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        actions: [
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(user.toString()),
            const Text(
              'You are logged in',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
