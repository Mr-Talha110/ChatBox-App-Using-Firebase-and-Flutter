import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/contact_list_controller.dart';
import 'package:note_app/screens/Save%20notes%20screens/create_note_screen.dart';
import 'package:note_app/screens/messaging%20screens/chat_screen.dart';
import 'package:note_app/utils/strings.dart';

import '../../utils/constants.dart';

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({super.key});

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final contactList = Get.put(ContactListController()).contacts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.greenColor,
          onPressed: () {
            Get.to(const CreateNoteScreen());
          },
          child: const Icon(
            Icons.note_alt_sharp,
            color: AppColors.white,
          ),
        ),
        appBar: AppBar(
          leadingWidth: 60,
          backgroundColor: AppColors.transparent,
          title: const Text(AppStrings.home),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          leading: const Icon(
            Icons.search,
            color: AppColors.white,
          ),
          actions: [
            Image.asset(
              'assets/images/me.png',
              width: 44,
            ),
            const SizedBox(width: 15),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contactList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(children: [
                        Image.asset(
                          contactList[index].image,
                          width: 52,
                        ),
                        Text(
                          contactList[index].name.split(' ').elementAt(0),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ]),
                    );
                  }),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 14, left: 24, right: 24),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 30,
                        height: 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.white)),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                      child: ListView.builder(
                          itemCount: contactList.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                extentRatio: 2 / 5,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 8),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: AppColors.backgroundColor),
                                      child: SvgPicture.asset(
                                        'assets/images/bell.svg',
                                        colorFilter: const ColorFilter.mode(
                                            AppColors.white, BlendMode.srcIn),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: AppColors.redAlert),
                                      child: SvgPicture.asset(
                                          'assets/images/trash.svg')),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(ChatScreen(
                                    chatId: contactList[index].id,
                                  ));
                                },
                                child: Container(
                                  width: double.infinity,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Stack(
                                              children: [
                                                Image.asset(
                                                  contactList[index].image,
                                                  width: 52,
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        color: index % 2 == 0
                                                            ? AppColors.greish
                                                            : AppColors.neon,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 12),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  contactList[index].name,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const Text(AppStrings.dummyMsg,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .greyColor))
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                              AppStrings.dummyTime,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.greyColor),
                                            ),
                                            const SizedBox(height: 7),
                                            index == 0 || index == 1
                                                ? Container(
                                                    width: 21,
                                                    height: 21,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color:
                                                            AppColors.redAlert),
                                                    child: const Center(
                                                        child: Text(
                                                      '3',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )),
                                                  )
                                                : Container()
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            );
                          }))
                ]),
              ),
            )
          ],
        ));
  }
}
