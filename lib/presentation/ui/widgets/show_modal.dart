import 'package:flutter/material.dart';

class ShowModal {
  static void showSnackBar(
      {required BuildContext context,
      required String text,
      bool? error,
      bool? success}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: error == true
              ? Colors.red
              : (success == true ? Colors.green : null),
          content: Text(text)),
    );
  }
}
