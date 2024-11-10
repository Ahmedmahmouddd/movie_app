import 'package:flutter/material.dart';

class DisplaySnack {
  static void errMessage(BuildContext context, String message) {
    var snackbar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
