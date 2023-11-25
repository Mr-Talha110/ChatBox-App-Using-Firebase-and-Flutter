import 'package:get/get.dart';
import 'package:note_app/models/contacts_model.dart';

class ContactListController extends GetxController {
  final List<ContactModel> contacts = <ContactModel>[
    ContactModel(
        isActive: true,
        id: 'm1',
        image: 'assets/images/afrin.png',
        bio: 'Life is beautiful 👌',
        name: 'Afrin Sabila '),
    ContactModel(
        isActive: true,
        id: 'm2',
        image: 'assets/images/john.png',
        bio: 'Make yourself proud 😍',
        name: 'John Borino'),
    ContactModel(
        isActive: false,
        id: 'm3',
        image: 'assets/images/bristy.png',
        bio: 'Keep working ✍',
        name: 'Bristy Haque'),
    ContactModel(
        isActive: true,
        id: 'm4',
        image: 'assets/images/adil.png',
        bio: 'Be your own hero 💪',
        name: 'Adil Adnan'),
    ContactModel(
        isActive: false,
        id: 'm5',
        image: 'assets/images/borsha.png',
        bio: 'Flowers are beautiful 🌸',
        name: 'Borsha Akther'),
    ContactModel(
        isActive: false,
        id: 'm6',
        image: 'assets/images/darrel.png',
        bio: 'Be your own hero 💪',
        name: 'Darrel Mac'),
    ContactModel(
        isActive: true,
        id: 'm7',
        image: 'assets/images/David.png',
        bio: 'Be your own hero 💪',
        name: 'David Warner'),
  ];
  int compareTo(ContactModel contact1, ContactModel contact2) {
    return contact1.name.compareTo(contact2.name);
  }

  void sortContacts() {
    contacts.sort(compareTo);
    update();
  }
}
