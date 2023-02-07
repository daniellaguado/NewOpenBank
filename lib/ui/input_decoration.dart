import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration decorations({
    required String labelText,
    String? hintText,
    Widget? counter,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black54,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20)),
      counter: counter,
      labelText: labelText,
      hintText: hintText,
      suffixIcon: suffixIcon,
      labelStyle: const TextStyle(color: Colors.black54),
    );
  }
}
