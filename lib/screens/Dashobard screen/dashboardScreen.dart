// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/screens/Settings%20screen/settings_screen.dart';
import 'package:note_app/utils/strings.dart';

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
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/text.svg',
                  colorFilter: currentPage == 0
                      ? const ColorFilter.mode(
                          Color(0xff24786D), BlendMode.srcIn)
                      : const ColorFilter.mode(
                          Color(0xff797C7B), BlendMode.srcIn),
                ),
                label: AppStrings.message,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Call.svg',
                  colorFilter: currentPage == 1
                      ? const ColorFilter.mode(
                          Color(0xff24786D), BlendMode.srcIn)
                      : const ColorFilter.mode(
                          Color(0xff797C7B), BlendMode.srcIn),
                ),
                label: AppStrings.calls,
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/user.svg',
                    colorFilter: currentPage == 2
                        ? const ColorFilter.mode(
                            Color(0xff24786D), BlendMode.srcIn)
                        : const ColorFilter.mode(
                            Color(0xff797C7B), BlendMode.srcIn),
                  ),
                  label: AppStrings.contact),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/settings.svg',
                    colorFilter: currentPage == 3
                        ? const ColorFilter.mode(
                            Color(0xff24786D), BlendMode.srcIn)
                        : const ColorFilter.mode(
                            Color(0xff797C7B), BlendMode.srcIn),
                  ),
                  label: AppStrings.settings),
            ]),
        body: tabs[currentPage]);
  }
}
