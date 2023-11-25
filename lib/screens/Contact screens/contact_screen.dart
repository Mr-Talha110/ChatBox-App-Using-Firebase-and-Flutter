import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/contact_list_controller.dart';
import 'package:note_app/utils/strings.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final contactListController = Get.put(ContactListController());
  @override
  void initState() {
    super.initState();
    contactListController.sortContacts();
  }

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
        title: const Text(AppStrings.contact),
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
              const Text(AppStrings.myContacts,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              Expanded(
                  child: ListView.builder(
                      itemCount: contactListController.contacts.length,
                      itemBuilder: (context, index) {
                        final contact = contactListController.contacts[index];
                        if (index == 0 ||
                            contact.name[0] !=
                                contactListController
                                    .contacts[index - 1].name[0]) {
                          return Column(
                            children: [
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(contact.name[0],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        contact.image,
                                        width: 52,
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(contact.name,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          Text(contact.bio,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ))
                                        ],
                                      )
                                    ]),
                              ),
                            ],
                          );
                        } else {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    contact.image,
                                    width: 52,
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(contact.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Text(contact.bio,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  )
                                ]),
                          );
                        }
                      }))
            ]),
          ),
        )
      ]),
    );
  }
}
