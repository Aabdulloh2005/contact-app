import 'package:flutter/material.dart';

class ContactEditDialog extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ContactEditDialog({super.key});

  String newName = '';
  String newPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit contact'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// text field for name
            TextFormField(
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter name';
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  newName = newValue;
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter new name for your contact',
              ),
            ),
            SizedBox(height: 20),

            /// text field for phone number
            TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter number';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter new phone number for your contact',
              ),
              onSaved: (newValue) {
                if (newValue != null) {
                  newPhoneNumber = newValue;
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
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.pop(context, {
                'newName': newName,
                'newPhoneNumber': newPhoneNumber,
              });
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
