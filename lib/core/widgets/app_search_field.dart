import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Search bar. [dark] = translucent style for dark headers (Home).
class AppSearchField extends StatelessWidget {
  const AppSearchField(
      {super.key, required this.hint, this.dark = false, this.onChanged});
  final String hint;
  final bool dark;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final fg = dark ? AppColors.textOnDarkMuted : AppColors.textMuted;
    return TextField(
      onChanged: onChanged,
      style: AppTextStyles.body
          .copyWith(color: dark ? AppColors.textOnDark : AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyMuted.copyWith(color: fg),
        prefixIcon: Icon(Icons.search, size: 18, color: fg),
        filled: true,
        fillColor: dark ? AppColors.searchBarDark : AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        border: OutlineInputBorder(
          borderRadius: AppRadius.all(AppRadius.md),
          borderSide: dark
              ? BorderSide.none
              : const BorderSide(color: AppColors.fieldBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.all(AppRadius.md),
          borderSide: dark
              ? BorderSide.none
              : const BorderSide(color: AppColors.fieldBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.all(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
