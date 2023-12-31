import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/contact/controller/contact_list_controller.dart';
import 'package:note_app/utils/strings.dart';
import 'package:note_app/widgets/people_list.dart';

import '../../../utils/constants.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final controller = Get.put(ContactListController());
  @override
  void initState() {
    super.initState();
    controller.sortContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leadingWidth: 60,
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            controller.goToSearchScreen();
          },
          icon: const Icon(
            Icons.search,
            color: AppColors.white,
          ),
        ),
        title: const Text(AppStrings.contact),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.person_add_alt_rounded,
            color: AppColors.white,
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
                color: AppColors.white,
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
                        color: AppColors.dotGrey)),
              ),
              const SizedBox(height: 25),
              const Text(AppStrings.myContacts,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              Expanded(
                  child: ListView.builder(
                      itemCount: controller.contacts.length,
                      itemBuilder: (context, index) {
                        final contact = controller.contacts[index];
                        if (index == 0 ||
                            contact.name[0] !=
                                controller.contacts[index - 1].name[0]) {
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
                              PeopleList(
                                bio: contact.bio,
                                imageUrl: contact.image,
                                name: contact.name,
                              )
                            ],
                          );
                        } else {
                          return PeopleList(
                            bio: contact.bio,
                            imageUrl: contact.image,
                            name: contact.name,
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
