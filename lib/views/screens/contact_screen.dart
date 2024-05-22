import 'package:flutter/material.dart';
import 'package:lesson/controllers/contacts_controller.dart';
import 'package:lesson/views/widgets/contact_add_dialog.dart';
import 'package:lesson/views/widgets/contact_edit_dialog.dart';
import 'package:lesson/views/widgets/contact_item.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final ContactsController contactsController = ContactsController();

  void deleteContact(int index) {
    contactsController.delete(index);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, String>? data = await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return const ContactAddDialog();
                  });
              contactsController.add(data!['name']!, data['phone']!);
              setState(() {});
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contactsController.contactList.length,
        itemBuilder: (BuildContext context, int index) {
          return ContactItem(
            name: contactsController.contactList[index].name,
            phone: contactsController.contactList[index].phone,
            color: contactsController.contactList[index].color,
            onDelete: () {
              deleteContact(index);
            },
            onEdit: () async {
              Map<String, String>? newData = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return ContactEditDialog();
                },
              );
              contactsController.editContact(
                index: index,
                newName: newData!['newName']!,
                newPhoneNumber: newData['newPhoneNumber']!,
              );
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
