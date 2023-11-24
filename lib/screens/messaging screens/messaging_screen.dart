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
                ]),
              ),
            )
          ],
        ));
  }
}
