import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatepickerPage extends StatefulWidget {
  const DatepickerPage({super.key});

  @override
  State<DatepickerPage> createState() => _DatepickerPageState();
}

class _DatepickerPageState extends State<DatepickerPage> {
  DateTime? selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final DateTime? date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
        

              );
              if (date != null) {
                setState(() {
                  selectedDate = date;
                });
              }
            },
            child: Text("Pilih tanggal lahir"),
          ),
          Text(
            "Tanggal Lahir : ${DateFormat('dd MMMM yyyy', 'id_ID').format(selectedDate!)}",
          ),
        ],
      ),
    );
  }
}
