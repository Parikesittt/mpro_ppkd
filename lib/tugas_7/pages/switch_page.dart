import 'package:belajar_ppkd/theme/theme.dart';
import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool isDark = false;
  void checkTheme() {
    if (Provider.of<ThemeProvider>(context, listen: false).themeData ==
        darkMode) {
      isDark = true;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkTheme();
      setState(() {}); // update UI setelah checkTheme jalan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Switch(
              activeThumbColor: Colors.white,
              value: isDark,
              onChanged: (value) {
                setState(() {
                  Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  ).toogleTheme();
                  isDark = value;
                });
              },
            ),
            Text("Aktifkan Mode Gelap"),
          ],
        ),
        Text(isDark ? "Mode gelap aktif" : "Mode terang"),
      ],
    );
  }
}
