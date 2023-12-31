// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/app/settings/views/settings_screen.dart';
import 'package:note_app/utils/strings.dart';

import '../../../utils/constants.dart';
import '../../calling/views/calls_screen.dart';
import '../../contact/views/contact_screen.dart';
import '../../messaging/views/messaging_screen.dart';

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
            backgroundColor: AppColors.white,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
            selectedItemColor: AppColors.greenColor,
            onTap: (index) {
              currentPage = index;
              setState(() {});
            },
            currentIndex: currentPage,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetRef.text,
                  colorFilter: currentPage == 0
                      ? const ColorFilter.mode(
                          AppColors.greenColor, BlendMode.srcIn)
                      : const ColorFilter.mode(
                          AppColors.greyColor, BlendMode.srcIn),
                ),
                label: AppStrings.message,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetRef.phone,
                  colorFilter: currentPage == 1
                      ? const ColorFilter.mode(
                          AppColors.greenColor, BlendMode.srcIn)
                      : const ColorFilter.mode(
                          AppColors.greyColor, BlendMode.srcIn),
                ),
                label: AppStrings.calls,
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetRef.contact,
                    colorFilter: currentPage == 2
                        ? const ColorFilter.mode(
                            AppColors.greenColor, BlendMode.srcIn)
                        : const ColorFilter.mode(
                            AppColors.greyColor, BlendMode.srcIn),
                  ),
                  label: AppStrings.contact),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetRef.settings,
                    colorFilter: currentPage == 3
                        ? const ColorFilter.mode(
                            AppColors.greenColor, BlendMode.srcIn)
                        : const ColorFilter.mode(
                            AppColors.greyColor, BlendMode.srcIn),
                  ),
                  label: AppStrings.settings),
            ]),
        body: tabs[currentPage]);
  }
}
