import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:belajar_ppkd/tugas_7/pages/checkbox_page.dart';
import 'package:belajar_ppkd/tugas_7/pages/datepicker_page.dart';
import 'package:belajar_ppkd/tugas_7/pages/dropdown_page.dart';
import 'package:belajar_ppkd/tugas_7/pages/switch_page.dart';
import 'package:belajar_ppkd/tugas_7/pages/timepicker_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _page = [
    CheckboxPage(),
    SwitchPage(),
    DropdownPage(),
    // DatepickerPage(),
    TimepickerPage(),
  ];
  final List<IconData> _iconDrawer = [
    Icons.description,
    Icons.lightbulb,
    Icons.shopping_bag,
    // Icons.calendar_month,
    Icons.alarm,
  ];
  final List<String> _title = [
    'Syarat & Ketentuan',
    'Aktifkan Mode Gelap',
    'Pilih Kategori Produk',
    // 'Pilih Tanggal Lahir',
    'Atur Pengingat',
  ];

  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Interaksi"),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: _page[_selectedIndex],
      ),
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
