import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/contact_list_controller.dart';
import 'package:note_app/screens/Save%20notes%20screens/create_note_screen.dart';

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
        backgroundColor: const Color(0xff000E08),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff24786D),
          onPressed: () {
            Get.to(const CreateNoteScreen());
          },
          child: const Icon(
            Icons.note_alt_sharp,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          leadingWidth: 60,
          backgroundColor: Colors.transparent,
          title: const Text('Home'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          leading: const Icon(
            Icons.search,
            color: Colors.white,
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
                            color: Colors.white,
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
                    color: Colors.white,
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
                            color: const Color(0xffe6e6e6))),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                      child: ListView.builder(
                          itemCount: contactList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(vertical: 15),
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
                                                        ? const Color(
                                                            0xff9A9E9C)
                                                        : const Color(
                                                            0xff0FE16D),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
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
                                            const Text("How are you today?",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff797C7B)))
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Text(
                                          '2 min ago',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff797C7B)),
                                        ),
                                        const SizedBox(height: 7),
                                        index == 0 || index == 1
                                            ? Container(
                                                width: 21,
                                                height: 21,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: const Color(
                                                        0xffF04A4C)),
                                                child: const Center(
                                                    child: Text(
                                                  '3',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                                              )
                                            : Container()
                                      ],
                                    )
                                  ]),
                            );
                          }))
                ]),
              ),
            )
          ],
        ));
  }
}
