// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:note_app/screens/Settings%20screen/settings_screen.dart';

import '../Calls screens/calls_screen.dart';
import '../Contact screens/contact_screen.dart';
import '../messaging screens/messaging_screen.dart';

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
      const MessagingScreen(),
      const CallsScreen(),
      const ContactScreen(),
      const SettingsScreen()
    ];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
            selectedItemColor: const Color(0xff24786D),
            onTap: (index) {
              currentPage = index;
              setState(() {});
            },
            currentIndex: currentPage,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded),
                label: 'Messages',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_3_rounded), label: 'Contacts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ]),
        body: tabs[currentPage]);
  }
}
