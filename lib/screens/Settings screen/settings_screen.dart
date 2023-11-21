import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/settings_list.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000E08),
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Settings',
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Column(children: [
        const SizedBox(height: 50),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(children: [
              Container(
                  width: 30,
                  height: 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xffe6e6e6))),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/person.png',
                        width: 60,
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nazrul Islam",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                          Text("Never give up 💪",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/images/qr.svg',
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Divider(color: Color(0xffF5F6F6)),
              const SizedBox(height: 20),
              const SettingsList(),
            ]),
          ),
        )
      ]),
    );
  }
}
