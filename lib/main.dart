import 'package:belajar_ppkd/day10/grid.dart';
import 'package:belajar_ppkd/day10/list.dart';
import 'package:belajar_ppkd/day12/tugas5.dart';
import 'package:belajar_ppkd/day9/tugas2.dart';
import 'package:belajar_ppkd/day_18/splash_screen.dart';
import 'package:belajar_ppkd/home_page.dart';
import 'package:belajar_ppkd/theme/theme.dart';
import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:belajar_ppkd/tugas1/user_profile.dart';
import 'package:belajar_ppkd/tugasUI/login_page.dart';
import 'package:belajar_ppkd/tugas_10/form_pendaftaran.dart';
import 'package:belajar_ppkd/tugas_10/welcome_page.dart';
import 'package:belajar_ppkd/tugas_7/home_screen.dart';
import 'package:belajar_ppkd/tugas_8/page_with_navbar.dart';
import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_file.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('id_ID', null);
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
      // home: const LoginPage(),
      // theme: ThemeData(fontFamily: 'SofiaPro'),
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/splash',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const MainScreen(),
        '/user': (context) => const UserProfileWidget(),
        '/list': (context) => const TugasListWidget(),
        '/grid': (context) => const TugasGridWidget(),
        '/form-pendaftaran': (context) => const FormPendaftaranPage(),
        '/splash': (context) => const SplashScreenDay18(),

        // '/welcome': (context) => const WelcomePage(nama: '', domisili: ''),
      },
    );
  }
}
