import 'package:flutter/material.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final List<String> categoryList = [
    'Buah-buahan',
    'Sayuran',
    'Elektronik',
    'Pakaian Pria',
    'Pakaian Wanita',
    'Alat Tulis Kantor',
    'Buku & Majalah',
    'Peralatan Dapur',
    'Makanan Ringan',
    'Minuman',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(categoryList[index]));
      },
    );
  }
}
