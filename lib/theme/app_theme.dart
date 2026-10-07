import 'package:flutter/material.dart';

class AppTheme {
  // ---------- Colors ----------
  static const Color primaryGreen = Color(0xFF388E3C);
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFFE8F5E9);

  static const Color orange = Color(0xFFFFA000);
  static const Color lightOrange = Color(0xFFFFF3E0);

  static const Color red = Color(0xFFD32F2F);
  static const Color lightRed = Color(0xFFFFEBEE);

  static const Color grey = Color(0xFF757575); // <-- Added
  static const Color lightGrey = Color(0xFFF5F5F5); // <-- Added

  static const Color background = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF212121);
  static const Color textLight = Color(0xFF9E9E9E);

  // ---------- Text Styles ----------
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textDark,
  );
  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textDark,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textDark,
  );
  static const TextStyle body = TextStyle(fontSize: 14, color: textDark);
  static const TextStyle caption = TextStyle(fontSize: 12, color: textLight);

  // ---------- Input Decoration Helper ----------
  static InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: textLight),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryGreen, width: 2),
      ),
    );
  }
}
