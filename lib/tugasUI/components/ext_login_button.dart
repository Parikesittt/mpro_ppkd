import 'package:flutter/material.dart';

class ExtLogButton extends StatelessWidget {
  const ExtLogButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.icon,
  });

  final String text;
  final double height;
  final double width;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Color(0xfff5f5f5)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(6),
            ),
          ),
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(icon), width: 16, height: 16),
            Text(text, style: TextStyle(color: Colors.black, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
