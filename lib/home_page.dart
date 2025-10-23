import 'package:belajar_ppkd/day_18/login_day_18.dart';
import 'package:belajar_ppkd/preferences/preference_handler.dart';
import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:belajar_ppkd/tugas_7/pages/checkbox_page.dart';
import 'package:belajar_ppkd/tugas_7/pages/datepicker_page.dart';
import 'package:belajar_ppkd/tugas_7/pages/dropdown_page.dart';
import 'package:belajar_ppkd/tugas_7/pages/switch_page.dart';
import 'package:belajar_ppkd/tugas_7/pages/timepicker_page.dart';
import 'package:belajar_ppkd/tugas_9/category_list.dart';
import 'package:belajar_ppkd/tugas_9/category_list_with_icon.dart';
import 'package:belajar_ppkd/tugas_9/category_list_with_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _page = [
    CategoryListPage(),
    CategoryListWithIcon(),
    CategoryListWithModel(),
    // SwitchPage(),
    // DropdownPage(),
    // DatepickerPage(),
    // TimepickerPage(),
  ];
  final List<IconData> _iconDrawer = [
    Icons.list,
    Icons.list,
    Icons.list,
    Icons.logout,
    // Icons.lightbulb,
    // Icons.shopping_bag,
    // Icons.calendar_month,
    // Icons.alarm,
  ];
  final List<String> _title = [
    'Category List',
    'Category List With Icon',
    'Category List Using Model',
    'Logout',
    // 'Aktifkan Mode Gelap',
    // 'Pilih Kategori Produk',
    // 'Pilih Tanggal Lahir',
    // 'Atur Pengingat',
  ];

  void onTapDrawer(int index) {
    if (index == _iconDrawer.length - 1) {
      // Logout
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Logout'),
          content: const Text('Yakin mau logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginDay18()),
                  (route) => false,
                );
                // Navigator.pushAndRemoveUntil(context, index);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Berhasil logout!')),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
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
      drawer: Drawer(
        child: ListView.builder(
          itemCount: _iconDrawer.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListDrawer(
                  icon: _iconDrawer[index],
                  title: _title[index],
                  click: () {
                    onTapDrawer(index);
                  },
                ),
                Divider(thickness: 2, color: Color(0xfff2f2f2)),
              ],
            );
          },
        ),
      ),
      body: _page[_selectedIndex],
    );
  }
}

class ListDrawer extends StatelessWidget {
  const ListDrawer({
    super.key,
    required this.icon,
    required this.title,
    this.click,
  });

  final IconData icon;
  final String title;
  final void Function()? click;

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: click);
  }
}
