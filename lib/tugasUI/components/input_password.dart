import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff888888)),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        // hintText: hintText,
        icon: Icon(icon),
        hintStyle: TextStyle(color: Color(0xff888888)),
      ),
    );
  }
}
