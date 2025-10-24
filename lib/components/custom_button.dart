import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.click,
    required this.buttonText,
    required this.height,
    required this.width,
  });
  final void Function()? click;
  final String buttonText;
  final double height;
  final double width;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.click,
        style: ElevatedButton.styleFrom(
          // foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          // disabledBackgroundColor: Theme.of(
          //   context,
          // ).colorScheme.onSurfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(widget.buttonText, style: TextStyle(fontSize: 12)),
      ),
    );
  }
}
