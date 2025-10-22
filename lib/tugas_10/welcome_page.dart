import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.nama, required this.domisili});
  final String nama;
  final String domisili;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Page"),
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
      body: Center(
        child: Text("Terimakasih ${widget.nama} dari ${widget.domisili} telah mendaftar!"),
      ),
    );
  }
}