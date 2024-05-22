import 'package:flutter/material.dart';
import 'package:lesson/controllers/random_color.dart';
import 'package:lesson/models/contact.dart';

class ContactsController {
  final List<Contact> _contactList = [
    Contact(name: 'Tom', phone: '+998 90 123 45 67', color: Colors.blueGrey),
    Contact(name: 'Jerry', phone: '+998 95 123 45 67', color: Colors.orange),
    Contact(name: 'Spike', phone: '+998 94 123 45 67', color: Colors.grey),
  ];

  List<Contact> get contactList {
    return [..._contactList];
  }

  void delete(index) {
    _contactList.removeAt(index);
  }

  void add(String name, String phone) {
    _contactList.add(
      Contact(
        name: name,
        phone: phone,
        color: ColorGenerator().getRandomColor(),
      ),
    );
  }

  void editContact({
    required int index,
    required String newName,
    required String newPhoneNumber,
  }) {
    _contactList[index].name = newName;
    _contactList[index].phone = newPhoneNumber;
  }
}
