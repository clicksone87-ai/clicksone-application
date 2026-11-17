import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: AppRadius.all(AppRadius.pill),
        boxShadow: const [
          BoxShadow(
              color: AppColors.primaryShadow, blurRadius: 18, offset: Offset(0, 6))
        ],
      ),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          minimumSize: const Size.fromHeight(AppSpacing.buttonHeight),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.all(AppRadius.pill)),
        ),
        child: Text(label, style: AppTextStyles.button),
      ),
    );
  }
}
