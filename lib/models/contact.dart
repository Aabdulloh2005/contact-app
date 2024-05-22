import 'package:flutter/material.dart';

class Contact {
  String name;
  String phone;
  Color color;

  Contact({
    required this.name,
    required this.phone,
    this.color = Colors.teal,
  });
}
