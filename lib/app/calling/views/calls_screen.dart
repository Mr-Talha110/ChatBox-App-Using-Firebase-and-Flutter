import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/app/contact/controller/contact_list_controller.dart';
import 'package:intl/intl.dart';
import 'package:note_app/app/contact/views/search_contact_screen.dart';
import 'package:note_app/utils/constants.dart';
import 'package:note_app/utils/strings.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  final contactList = Get.put(ContactListController()).contacts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leadingWidth: 60,
        centerTitle: true,
        title: const Text(
          AppStrings.calls,
          style: TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.to(const SearchContactScreen());
          },
          icon: const Icon(
            Icons.search,
            color: AppColors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(
            Icons.phone,
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
            child: Column(children: [
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
              const Align(
                alignment: Alignment.topLeft,
                child: Text(AppStrings.recent,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                      itemCount: contactList.length,
                      itemBuilder: (context, index) {
                        String formattedDate =
                            DateFormat.jm().format(DateTime.now());
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    contactList[index].image,
                                    width: 52,
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(contactList[index].name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(index % 2 == 0
                                              ? AssetRef.receiveCall
                                              : AssetRef.madeCall),
                                          const SizedBox(width: 5),
                                          Text(formattedDate)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AssetRef.phone),
                                  const SizedBox(width: 15),
                                  SvgPicture.asset(AssetRef.videoCall),
                                ],
                              )
                            ],
                          ),
                        );
                      }))
            ]),
          ),
        )
      ]),
    );
  }
}
