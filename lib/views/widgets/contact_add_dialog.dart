import 'package:flutter/material.dart';

class ContactAddDialog extends StatefulWidget {
  const ContactAddDialog({super.key});

  @override
  State<ContactAddDialog> createState() => _ContactAddDialogState();
}

class _ContactAddDialogState extends State<ContactAddDialog> {
  void addContact() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name = '';

  String phone = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add contact'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Enter name!';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
              onSaved: (newValue) {
                if (newValue != null) {
                  name = newValue;
                }
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Enter number!';
                } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                  return 'Enter valid number';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.add),
                border: OutlineInputBorder(),
                hintText: 'Phone number',
              ),
              onSaved: (newValue) {
                if (newValue != null) {
                  phone = newValue;
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("cancel"),
        ),
        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pop(context, {
                  'name': name,
                  'phone': phone,
                });
              }
            },
            child: const Text('Add'))
      ],
    );
  }
}
