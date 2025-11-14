import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.click,
    this.isEnable = true,
    this.isLoading,
  });

  final String text;
  final double height;
  final bool isEnable;
  final double width;
  final void Function()? click;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: click,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnable ? Color(0xff21BDCA) : Color(0xff888888),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        // style: ButtonStyle(
        //   backgroundColor: isEnable
        //       ? WidgetStateProperty.all(Color(0xff21BDCA))
        //       : WidgetStateProperty.all(Color(0xff888888)),
        //   shape: WidgetStateProperty.all(
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        //   ),
        // ),
        child: isLoading == true
            ? CircularProgressIndicator()
            : Text(
                text,
                // "Login",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
