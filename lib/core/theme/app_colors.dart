import 'package:flutter/material.dart';

/// All colors used in Clicksone. Never hardcode Color(0x...) inside screens.
class AppColors {
  AppColors._();

  // Brand
  static const primary = Color(0xFF6C3BFF);
  static const primaryShadow = Color(0x666C3BFF);

  // Backgrounds
  static const darkBg = Color(0xFF13111F);
  static const lightBg = Color(0xFFF4F1FF);
  static const surface = Color(0xFFFFFFFF);
  static const fieldFill = Color(0xFFF3F0FD);
  static const fieldBorder = Color(0xFFE4DEFA);
  static const divider = Color(0xFFEEEAF8);
  static const keyCircle = Color(0xFFDDD0FF);
  static const searchBarDark = Color(0x1FFFFFFF);
  static const progressTrack = Color(0x40FFFFFF);
  static const shadowSoft = Color(0x146C3BFF);

  // Text
  static const textPrimary = Color(0xFF14121F);
  static const textMuted = Color(0xFF9A96AE);
  static const textOnDark = Color(0xFFFFFFFF);
  static const textOnDarkMuted = Color(0xB3FFFFFF);

  // Status / accents
  static const success = Color(0xFF2DD4A7);
  static const successBg = Color(0xFFDDF7EE);
  static const successText = Color(0xFF1FA37A);
  static const coral = Color(0xFFFF6B4A);
  static const amber = Color(0xFFFFB800);
  static const badge = Color(0xFFFF5A4F);

  // Nav
  static const navInactive = Color(0xFF8E8AA3);

  // Decorative background glows
  static const glowPurple = Color(0x666C3BFF);
  static const glowRed = Color(0x66B04A4A);
  static const glowTeal = Color(0x552DB89A);
}
