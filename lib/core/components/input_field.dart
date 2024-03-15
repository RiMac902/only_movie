import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.labelText, this.controller, this.onSubmitted, this.onChanged});

  final String labelText;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
    onChanged: onChanged,
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: labelText,
      ),
    );
  }
}
