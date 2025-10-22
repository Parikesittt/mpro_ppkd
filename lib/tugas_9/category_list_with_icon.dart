import 'package:flutter/material.dart';

class CategoryListWithIcon extends StatefulWidget {
  const CategoryListWithIcon({super.key});

  @override
  State<CategoryListWithIcon> createState() => _CategoryListWithIconState();
}

class _CategoryListWithIconState extends State<CategoryListWithIcon> {
  final List<Map<String, dynamic>> categoryList = [
    {'name': 'Buah-buahan', 'icon': Icons.apple},
    {'name': 'Sayuran', 'icon': Icons.spa},
    {'name': 'Elektronik', 'icon': Icons.devices},
    {'name': 'Pakaian Pria', 'icon': Icons.man},
    {'name': 'Pakaian Wanita', 'icon': Icons.woman},
    {'name': 'Alat Tulis Kantor', 'icon': Icons.edit},
    {'name': 'Buku & Majalah', 'icon': Icons.menu_book},
    {'name': 'Peralatan Dapur', 'icon': Icons.kitchen},
    {'name': 'Makanan Ringan', 'icon': Icons.fastfood},
    {'name': 'Minuman', 'icon': Icons.local_drink},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        final item = categoryList[index];
        return ListTile(leading: Icon(item['icon']), title: Text(item['name']));
      },
    );
  }
}
