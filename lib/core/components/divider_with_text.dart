import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey.shade800,
            thickness: 0.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(color: Colors.grey.shade800),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey.shade800,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
