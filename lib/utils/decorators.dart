import 'package:flutter/material.dart';

EdgeInsets itemPadding = const EdgeInsets.fromLTRB(10, 5, 10, 5);

TextStyle headingStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle tabStyle = const TextStyle(
  fontSize: 18,
  color: Colors.black87,
);

InputDecoration dropdownDecorator({String? labelText}) => InputDecoration(
      border: const OutlineInputBorder(),
      labelText: labelText,
      contentPadding: itemPadding,
    );

InputDecoration textFieldDecorator({String? labelText}) => InputDecoration(
      labelText: labelText,
      border: const OutlineInputBorder(),
      contentPadding: itemPadding,
    );
