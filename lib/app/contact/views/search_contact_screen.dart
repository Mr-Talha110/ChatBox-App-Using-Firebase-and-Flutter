import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/contact/controller/contact_list_controller.dart';
import 'package:note_app/utils/constants.dart';
import 'package:note_app/utils/strings.dart';
import 'package:note_app/widgets/people_list.dart';

class SearchContactScreen extends StatefulWidget {
  const SearchContactScreen({super.key});

  @override
  State<SearchContactScreen> createState() => _SearchContactScreenState();
}

class _SearchContactScreenState extends State<SearchContactScreen> {
  final controller = Get.put(ContactListController());

  final searchFilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchFilter,
              cursorColor: AppColors.greenColor,
              decoration: InputDecoration(
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  fillColor: AppColors.fieldColor,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: AppStrings.search,
                  suffixIcon: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close))),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(AppStrings.people,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: controller.contacts.length,
                  itemBuilder: (context, index) {
                    final title = controller.contacts[index].name;
                    if (searchFilter.text.isEmpty) {
                      return PeopleList(
                        bio: controller.contacts[index].bio,
                        imageUrl: controller.contacts[index].image,
                        name: controller.contacts[index].name,
                      );
                    } else if (title
                        .toLowerCase()
                        .contains(searchFilter.text.toLowerCase())) {
                      return PeopleList(
                        bio: controller.contacts[index].bio,
                        imageUrl: controller.contacts[index].image,
                        name: controller.contacts[index].name,
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
