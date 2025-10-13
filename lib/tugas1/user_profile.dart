import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Profil Pengguna"), 
        backgroundColor: Theme.of(context).colorScheme.secondary, 
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toogleTheme();
            }, 
            icon: Icon(Icons.lightbulb))
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              'Nama : Parikesit', 
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                Icon(Icons.location_on, color: Colors.blue[600],),
                Text(
                  'Jakarta',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              'Saya sedang belajar flutter',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      )
    );
  }
}