import 'package:belajar_ppkd/tugas_7/home_screen.dart';
import 'package:belajar_ppkd/tugas_8/pages/description.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class PageWithNavbar extends StatefulWidget {
  const PageWithNavbar({super.key});

  @override
  State<PageWithNavbar> createState() => _PageWithNavbarState();
}

class _PageWithNavbarState extends State<PageWithNavbar>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  int _selectedIndex = 0;
  final List<BottomNavigationBarItem> _navbarItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: "Description",
    ),
  ];

  @override
  void initState() {
    super.initState();

    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    super.dispose();

    // _tabController.dispose();
  }

  static const List<Widget> _page = [HomeScreen(), DescriptionPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   items: _navbarItem,
      //   onTap: (value) {
      //     setState(() {
      //       _selectedIndex = value;
      //     });
      //   },
      // ),
      body: _page[_selectedIndex],
      bottomNavigationBar: MotionTabBar(
        controller:
            _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "Home",
        useSafeArea: true, // default: true, apply safe area wrapper
        labelAlwaysVisible:
            true, // default: false, set to "true" if you need to always show labels
        labels: const ["Home", "Description"],

        //// use default icon (with IconData)
        icons: const [
          // Icons.dashboard,
          Icons.home,
          // Icons.people_alt,
          Icons.business_center,
        ],

        // use custom widget as display Icon

        // optional badges, length must be same with labels
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        // tabIconColor: Colors.blue[600],
        tabIconSize: 28.0,
        tabIconSelectedSize: 32.0,
        tabSelectedColor: Colors.white,
        tabIconSelectedColor: Colors.black,
        tabBarColor: Colors.green.shade300,
        onTabItemSelected: (int value) {
          setState(() {
            _selectedIndex = value;
            _motionTabBarController!.index = value;
          });
        },
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
      //     ],
      //   ),
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      //       child: GNav(
      //         rippleColor: Colors.grey[300]!,
      //         hoverColor: Colors.grey[100]!,
      //         gap: 8,
      //         activeColor: Colors.black,
      //         iconSize: 24,
      //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      //         duration: Duration(milliseconds: 400),
      //         tabBackgroundColor: Colors.grey[100]!,
      //         color: Colors.black,
      //         tabs: [
      //           GButton(icon: Icons.home, text: 'Home'),
      //           GButton(icon: Icons.business_center_sharp, text: 'Description'),
      //         ],
      //         selectedIndex: _selectedIndex,
      //         onTabChange: (index) {
      //           setState(() {
      //             _selectedIndex = index;
      //           });
      //         },
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
