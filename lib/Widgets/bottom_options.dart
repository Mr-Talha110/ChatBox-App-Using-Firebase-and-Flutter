import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/app/messaging/controller/chat_screen_controller.dart';

import '../utils/constants.dart';
import '../utils/strings.dart';

class BottomOptions extends StatefulWidget {
  const BottomOptions({super.key});

  @override
  State<BottomOptions> createState() => _BottomOptionsState();
}

class _BottomOptionsState extends State<BottomOptions> {
  final optionsList = Get.put(ChatScreenController()).optionsList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 572,
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close)),
            const Spacer(),
            const Text(AppStrings.shareContent,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.backgroundColor)),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
            child: ListView.builder(
                itemCount: optionsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(optionsList[index].image),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(optionsList[index].title,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text(optionsList[index].subtitle,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              )
                            ]),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: AppColors.lightGrey,
                        thickness: 0.4,
                      )
                    ],
                  );
                }))
      ]),
    );
  }
}
