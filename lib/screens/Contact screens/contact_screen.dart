import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/contact_list_controller.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final contactList = Get.put(ContactListController()).contacts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000E08),
      appBar: AppBar(
        leadingWidth: 60,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        title: const Text('Contacts'),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.person_add_alt_rounded,
            color: Colors.white,
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 60,
        ),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              const Text("My Contact",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 25),
              Expanded(
                  child: ListView.builder(
                      itemCount: contactList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  contactList[index].image,
                                  width: 52,
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(contactList[index].name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text(contactList[index].bio,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ))
                                  ],
                                )
                              ]),
                        );
                      }))
            ]),
          ),
        )
      ]),
    );
  }
}
