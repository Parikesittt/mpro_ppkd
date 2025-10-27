import 'package:belajar_ppkd/day10/grid.dart';
import 'package:belajar_ppkd/day12/tugas5.dart';
import 'package:belajar_ppkd/day9/tugas2.dart';
import 'package:belajar_ppkd/view/dashboard_page.dart';
import 'package:belajar_ppkd/view/stock_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _page = [
    DashboardPage(),
    StockPage(),
    Tugas5(),
    Tugas2Widget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
            icon: Icon(FontAwesomeIcons.house, size: 20),
            title: Text("Dashboard"),
          ),
          BottomBarItem(
            icon: Icon(FontAwesomeIcons.boxOpen, size: 20),
            title: Text("Stock"),
          ),
          BottomBarItem(
            icon: Icon(FontAwesomeIcons.wallet, size: 20),
            title: Text("Stock"),
          ),
          BottomBarItem(
            icon: Icon(FontAwesomeIcons.user, size: 20),
            title: Text("Stock"),
          ),
        ],
        option: AnimatedBarOptions(
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          opacity: 0.3,
          // dotStyle: DotStyle.tile,
          // gradient: const LinearGradient(
          //   colors: [Colors.deepPurple, Colors.pink],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
