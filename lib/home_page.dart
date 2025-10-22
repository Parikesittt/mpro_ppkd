import 'package:belajar_ppkd/day10/grid.dart';
import 'package:belajar_ppkd/day10/list.dart';
import 'package:belajar_ppkd/day12/tugas5.dart';
import 'package:belajar_ppkd/day9/tugas2.dart';
import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:belajar_ppkd/tugas1/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _page = [
    Tugas2Widget(),
    TugasGridWidget(),
    UserProfileWidget(),
  ];
  List<NavbarItem> items = [
    NavbarItem(
      Icons.home_outlined,
      'Home',
      backgroundColor: mediumPurple,
      selectedIcon: Icon(Icons.home, size: 20),
    ),
    NavbarItem(
      Icons.shopping_bag_outlined,
      'Products',
      backgroundColor: Colors.orange,
      selectedIcon: Icon(Icons.shopping_bag, size: 20),
    ),
    NavbarItem(
      Icons.person_outline,
      'Me',
      backgroundColor: Colors.teal,
      selectedIcon: Icon(Icons.person, size: 20),
    ),
  ];

  final Map<int, Map<String, Widget>> _routes = const {
    0: {'/': Tugas5()},
    1: {'/': TugasGridWidget()},
    2: {'/': UserProfileWidget()},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toogleTheme();
            },
            icon: Icon(Icons.lightbulb),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      bottomNavigationBar: NavbarRouter(
        errorBuilder: (context) {
          return const Center(child: Text('Error 404'));
        },
        onBackButtonPressed: (isExiting) {
          return isExiting;
        },
        destinationAnimationCurve: Curves.fastOutSlowIn,
        destinationAnimationDuration: 600,
        decoration: NavbarDecoration(
          navbarType: BottomNavigationBarType.shifting,
        ),
        destinations: [
          for (int i = 0; i < items.length; i++)
            DestinationRouter(
              navbarItem: items[i],
              destinations: [
                for (int j = 0; j < _routes[i]!.keys.length; j++)
                  Destination(
                    route: _routes[i]!.keys.elementAt(j),
                    widget: _routes[i]!.values.elementAt(j),
                  ),
              ],
              initialRoute: _routes[i]!.keys.first,
            ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.grid_3x3_rounded),
      //       label: "Grid",
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      // ),
      body: _page[_selectedIndex],
      // body: ListView(
      //   children: [
      //     ListWidget(
      //       title: 'Tugas User Profile',
      //       tap: () {
      //         Navigator.pushNamed(context, '/user');
      //       },
      //     ),
      //     ListWidget(
      //       title: 'Tugas Grid View',
      //       tap: () {
      //         Navigator.pushNamed(context, '/grid');
      //       },
      //     ),
      //     ListWidget(
      //       title: 'Tugas List View',
      //       tap: () {
      //         Navigator.pushNamed(context, '/list');
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({super.key, this.tap, required this.title});

  final String title;
  final void Function()? tap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: InkWell(onTap: tap, child: Text("Open")),
    );
  }
}
