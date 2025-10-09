import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text("Profil Pengguna"), backgroundColor: Colors.cyanAccent,),
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