import 'package:belajar_ppkd/day10/grid.dart';
import 'package:belajar_ppkd/day10/list.dart';
import 'package:belajar_ppkd/day12/tugas5.dart';
import 'package:belajar_ppkd/day9/tugas2.dart';
import 'package:belajar_ppkd/theme/theme.dart';
import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:belajar_ppkd/tugas1/user_profile.dart';
import 'package:belajar_ppkd/tugasUI/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      // theme: ThemeData(fontFamily: 'SofiaPro'),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
