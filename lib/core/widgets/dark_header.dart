import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import 'glow_blob.dart';

/// Dark purple-glow header used on Login, Forgot Password, Home, Messages, Profile.
class DarkHeader extends StatelessWidget {
  const DarkHeader({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(
        AppSpacing.xl, AppSpacing.lg, AppSpacing.xl, AppSpacing.xl),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Container(
      width: double.infinity,
      color: AppColors.darkBg,
      child: Stack(
        children: [
          Positioned(
              top: -w * 0.25,
              left: w * 0.1,
              child: GlowBlob(size: w * 0.8, color: AppColors.glowPurple)),
          SafeArea(
              bottom: false, child: Padding(padding: padding, child: child)),
        ],
      ),
    );
  }
}
