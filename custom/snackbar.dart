// ignore_for_file: unused_element

import "package:flutter/material.dart";

void _showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 4),
    content: Container(
      height: 80.0,
      child: const Center(
        child: Text(
          'anything',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    ),
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

// content makes it customizable
