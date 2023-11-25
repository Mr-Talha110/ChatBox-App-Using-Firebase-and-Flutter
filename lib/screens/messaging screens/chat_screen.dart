import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  const ChatScreen({super.key, required this.chatId});

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
                      child: SvgPicture.asset('assets/images/Back.svg')),
                  const SizedBox(width: 10),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/me.png',
                        width: 44,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: const Color(0xff0FE16D),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Jhon Abraham",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Text("Active now",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff797C7B)))
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/Call.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    'assets/images/Video.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
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
                    color: const Color(0xffF3F6F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Write your message',
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff797C7B)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      )),
                      SvgPicture.asset('assets/images/files.svg'),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SvgPicture.asset('assets/images/camera.svg'),
              const SizedBox(width: 12),
              SvgPicture.asset('assets/images/microphone.svg'),
            ],
          ),
        )
      ],
    ));
  }
}
