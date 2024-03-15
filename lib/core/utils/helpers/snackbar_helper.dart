import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showError(BuildContext context, dynamic e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
        backgroundColor: CupertinoColors.systemRed,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}