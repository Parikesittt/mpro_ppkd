import 'package:belajar_ppkd/day_18/login_day_18.dart';
import 'package:belajar_ppkd/day_19/view/login_page.dart';
import 'package:belajar_ppkd/home_page.dart';
import 'package:belajar_ppkd/preferences/preference_handler.dart';
import 'package:belajar_ppkd/view/login_page.dart';
// import 'package:belajar_ppkd/tugas_7/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:ppkd_b4/constant/app_image.dart';
// import 'package:ppkd_b4/day_15/drawer.dart';
// import 'package:ppkd_b4/day_18/login_screen_18.dart';
// import 'package:ppkd_b4/preferences/preference_handler.dart';

class SplashScreenDay18 extends StatefulWidget {
  const SplashScreenDay18({super.key});

  @override
  State<SplashScreenDay18> createState() => _SplashScreenDay18State();
}

class _SplashScreenDay18State extends State<SplashScreenDay18> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/iconGoogle.png')),
          Text(
            "Hello",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
