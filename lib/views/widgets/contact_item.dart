import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String name;
  final String phone;
  final Color color;
  final Function() onDelete;
  final Function() onEdit;

  const ContactItem({
    super.key,
    required this.name,
    required this.phone,
    required this.color,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
      ),
      title: Text(name),
      subtitle: Text(phone),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                onEdit();
              }, icon: const Icon(Icons.edit, color: Colors.blue)),
          IconButton(
              onPressed: () {
                onDelete();
              },
              icon: const Icon(Icons.delete, color: Colors.red)),
        ],
      ),
    );
  }
}
