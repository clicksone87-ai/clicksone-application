import 'package:flutter/material.dart';
import 'app_colors.dart';

/// All font sizes live here. Use copyWith(color: ...) in screens when needed.
class AppTextStyles {
  AppTextStyles._();

  static const display = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: AppColors.textOnDark,
      letterSpacing: -0.5);
  static const title = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.textOnDark);
  static const heading = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary);
  static const subheading = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary);
  static const body = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimary);
  static const bodyMuted = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textMuted);
  static const caption = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textOnDarkMuted);
  static const label = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary);
  static const button = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textOnDark);
  static const tiny = TextStyle(
      fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textMuted);
}
