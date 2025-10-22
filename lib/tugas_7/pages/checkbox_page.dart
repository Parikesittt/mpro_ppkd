import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: Colors.blue,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text("Saya menyetujui semua persyaratan yang berlaku"),
          ],
        ),
        isChecked
            ? Text("Lanjutkan pendaftaran diperbolehkan")
            : Text("Anda belum bisa melanjutkan"),
      ],
    );
  }
}
