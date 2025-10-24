import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
