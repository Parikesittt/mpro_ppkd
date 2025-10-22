import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String? valueDropdown;
  final List<String> listCategory = [
    'Elektronik',
    'Pakaian',
    'Makanan',
    'Perabotan',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButton(
            value: valueDropdown,
            items: listCategory.map((String val) {
              return DropdownMenuItem(value: val, child: Text(val));
            }).toList(),
            onChanged: (value) {
              setState(() {
                valueDropdown = value;
              });
            },
          ),
          Text("Anda memilih kategori : ${valueDropdown ?? ""}"),
        ],
      ),
    );
  }
}
