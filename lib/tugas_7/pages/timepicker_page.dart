import 'package:flutter/material.dart';

class TimepickerPage extends StatefulWidget {
  const TimepickerPage({super.key});

  @override
  State<TimepickerPage> createState() => _TimepickerPageState();
}

class _TimepickerPageState extends State<TimepickerPage> {
  TimeOfDay? timePicked = TimeOfDay.now();

  // String formatTime = 'Test';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                setState(() {
                  timePicked = time;
                });
              }
            },
            child: Text("Pilih waktu pengingat"),
          ),
          // Text(Time)
          Text("Pengingat diatur pukul: ${timePicked!.format(context)}"),
        ],
      ),
    );
  }
}
