import 'package:get/get.dart';

class ContactModel extends GetxController {
  final String image;
  final String name;
  final String bio;
  final String id;
  bool isActive;
  ContactModel(
      {required this.id,
      required this.image,
      required this.bio,
      this.isActive = false,
      required this.name});
}
