import 'package:flutter/material.dart';

void showSnackBar(context, String? title) {

  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    content: new Text(title ?? "Snack bar"),
    duration: const Duration(milliseconds: 2000),
    padding: const EdgeInsets.symmetric(
      horizontal: 8.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ));
}
