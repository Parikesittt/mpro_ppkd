import 'package:flutter/material.dart';

class FormFieldPendaftaran extends StatefulWidget {
  const FormFieldPendaftaran({
    super.key,
    required this.labelText,
    required TextEditingController controller, this.validator,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  State<FormFieldPendaftaran> createState() => _FormFieldPendaftaranState();
}

class _FormFieldPendaftaranState extends State<FormFieldPendaftaran> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: widget.labelText),
      controller: widget._controller,
      validator: widget.validator,
    );
  }
}