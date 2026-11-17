import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.fillColor,
    this.textInputAction,
  });

  final String hint;
  final TextEditingController? controller;
  final IconData? icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final TextInputAction? textInputAction;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscured = widget.obscureText;

  OutlineInputBorder _border(Color c) => OutlineInputBorder(
      borderRadius: AppRadius.all(AppRadius.md), borderSide: BorderSide(color: c));

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscured,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: AppTextStyles.body,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppTextStyles.bodyMuted,
        filled: true,
        fillColor: widget.fillColor ?? AppColors.fieldFill,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg, vertical: AppSpacing.lg),
        prefixIcon: widget.icon == null
            ? null
            : Icon(widget.icon, size: 18, color: AppColors.textMuted),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                    _obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 18,
                    color: AppColors.textMuted),
                onPressed: () => setState(() => _obscured = !_obscured),
              )
            : null,
        enabledBorder: _border(AppColors.fieldBorder),
        border: _border(AppColors.fieldBorder),
        focusedBorder: _border(AppColors.primary),
      ),
    );
  }
}
