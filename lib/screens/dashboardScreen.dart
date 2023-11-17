// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/screens/create_note_screen.dart';
import 'package:note_app/screens/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Get.to(const CreateNoteScreen());
          },
          child: const Icon(
            Icons.ads_click,
            color: Colors.white,
          ),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(24),
          child: const Column(children: [
            Text(
              'Your are ln',
              style: TextStyle(
                  color: Colors.red, fontSize: 35, fontWeight: FontWeight.w900),
            ),
          ]),
        ));
  }
}
