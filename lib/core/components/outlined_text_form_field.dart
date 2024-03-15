import 'package:flutter/material.dart';

import '../../core/utils/validation/auth_validation.dart';



class OutlinedTextFormField extends StatelessWidget {
  const OutlinedTextFormField({super.key, required this.labelText, required this.controller});

  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: labelText == 'Email' ? TextInputType.emailAddress : null,
        obscureText: labelText == 'Password',
        validator: (value) {
          switch (labelText) {
            case 'Email':
              return AuthValidation.validateEmail(value!);
            case 'Password':
              return AuthValidation.validatePassword(value!);
            case 'Nickname':
              return AuthValidation.validateNickname(value!);
            default:
              return null;
          }
        },
      ),
    );
  }
}
