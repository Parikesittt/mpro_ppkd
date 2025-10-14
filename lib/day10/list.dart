import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TugasListWidget extends StatelessWidget {
  const TugasListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hewan"),
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama'),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukan nama',
                  hintStyle: TextStyle(color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email'),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'test@mail.com',
                  hintStyle: TextStyle(color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('No. HP'),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '62888888',
                  hintStyle: TextStyle(color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Deskripsi'),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ini deskripsi',
                  hintStyle: TextStyle(color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Image.asset('assets/images/sapi.png'),
            title: Text('Sapi'),
            subtitle: Text('Rp 1.000.000.000'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Image.asset('assets/images/kambing.png'),
            title: Text('Kambing'),
            subtitle: Text('Rp 5.000.000'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Image.asset('assets/images/ayam.png'),
            title: Text('Ayam'),
            subtitle: Text('Rp 100.000'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Image.asset('assets/images/kuda.png'),
            title: Text('Kuda'),
            subtitle: Text('Rp 20.000.000'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Image.asset('assets/images/kudanil.png'),
            title: Text('Kudanil'),
            subtitle: Text('Rp 5.000.000.000'),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
