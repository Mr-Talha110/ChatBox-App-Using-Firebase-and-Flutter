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
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List tabs = [
      Center(
        child: Text('Home Page'),
      ),
      Center(
        child: Text('Calls Page'),
      ),
      Center(
        child: Text('Contact Page'),
      ),
      Center(
        child: Text('Settings Page'),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff575DFB),
          actions: [
            const Text(
              'Logout',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
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
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color(0xFF565DFA),
            onTap: (index) {
              currentPage = index;
              setState(() {});
            },
            currentIndex: currentPage,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_3_rounded), label: 'Contacts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff575DFB),
          onPressed: () {
            Get.to(const CreateNoteScreen());
          },
          child: const Icon(
            Icons.note_alt_sharp,
            color: Colors.white,
          ),
        ),
        body: tabs[currentPage]);
  }
}
