import 'package:get/get.dart';
import 'package:note_app/models/contacts_model.dart';

class ContactListController extends GetxController {
  final List contacts = <ContactModel>[
    ContactModel(
        image: 'assets/images/afrin.png',
        bio: 'Life is beautiful 👌',
        name: 'Afrin Sabila '),
    ContactModel(
        image: 'assets/images/john.png',
        bio: 'Make yourself proud 😍',
        name: 'John Borino'),
    ContactModel(
        image: 'assets/images/bristy.png',
        bio: 'Keep working ✍',
        name: 'Bristy Haque'),
    ContactModel(
        image: 'assets/images/adil.png',
        bio: 'Be your own hero 💪',
        name: 'Adil Adnan'),
    ContactModel(
        image: 'assets/images/borsha.png',
        bio: 'Flowers are beautiful 🌸',
        name: 'Borsha Akther'),
    ContactModel(
        image: 'assets/images/afrin.png',
        bio: 'Flowers are beautiful 🌸',
        name: 'Afrin Sabila'),
    ContactModel(
        image: 'assets/images/adil.png',
        bio: 'Be your own hero 💪',
        name: 'Adil Adnan'),
  ];
}
