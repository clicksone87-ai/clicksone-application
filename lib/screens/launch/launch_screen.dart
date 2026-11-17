import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/brand_logo.dart';
import '../../core/widgets/glow_blob.dart';
import '../../core/widgets/primary_button.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: Stack(
        children: [
          Positioned(
              top: -size.width * 0.15,
              left: -size.width * 0.2,
              child: GlowBlob(size: size.width * 0.9, color: AppColors.glowPurple)),
          Positioned(
              right: -size.width * 0.25,
              bottom: size.height * 0.18,
              child: GlowBlob(size: size.width * 0.75, color: AppColors.glowRed)),
          Positioned(
              left: size.width * 0.02,
              bottom: size.height * 0.12,
              child: GlowBlob(size: size.width * 0.55, color: AppColors.glowTeal)),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxl),
                    child: Column(
                      children: [
                        const Spacer(flex: 3),
                        const BrandLogo(size: 88),
                        const SizedBox(height: AppSpacing.xl),
                        const Text('Clicksone', style: AppTextStyles.display),
                        const SizedBox(height: AppSpacing.sm),
                        Text('Design. Create. Inspire.',
                            style: AppTextStyles.caption
                                .copyWith(color: AppColors.textOnDark)),
                        const Spacer(flex: 3),
                        PrimaryButton(
                          label: 'Get Started →',
                          // extra: true -> open Sign Up tab
                          onPressed: () =>
                              context.go(AppRoutes.login, extra: true),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        TextButton(
                          onPressed: () => context.go(AppRoutes.login),
                          child: Text('Already have an account? Sign in',
                              style: AppTextStyles.caption),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
