import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/models/contacts_model.dart';
import 'package:note_app/utils/constants.dart';
import 'package:note_app/utils/strings.dart';

class ChatScreen extends StatefulWidget {
  final ContactModel contact;
  const ChatScreen({super.key, required this.contact});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
          width: double.infinity,
          height: 124,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(AssetRef.backArrow)),
                  const SizedBox(width: 10),
                  Stack(
                    children: [
                      Image.asset(
                        widget.contact.image,
                        width: 44,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: widget.contact.isActive
                                  ? AppColors.neon
                                  : AppColors.greish,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.contact.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(
                          widget.contact.isActive
                              ? AppStrings.activeNow
                              : 'Last seen 1 hour ago',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyColor))
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetRef.phone,
                    colorFilter: const ColorFilter.mode(
                        AppColors.backgroundColor, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    AssetRef.videoCall,
                    colorFilter: const ColorFilter.mode(
                        AppColors.backgroundColor, BlendMode.srcIn),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          width: double.infinity,
        )),
        Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          height: 90,
          child: Row(
            children: [
              const Icon(Icons.attach_file_outlined),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: AppStrings.writeMessage,
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyColor),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      )),
                      SvgPicture.asset(AssetRef.files),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SvgPicture.asset(AssetRef.camera),
              const SizedBox(width: 12),
              SvgPicture.asset(AssetRef.microphone),
            ],
          ),
        )
      ],
    ));
  }
}
