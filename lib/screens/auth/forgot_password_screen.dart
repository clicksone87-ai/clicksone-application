import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/dark_header.dart';
import '../../core/widgets/primary_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  void _sendLink() {
    // TODO: connect backend (send reset link)
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Reset link sent (demo)')));
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: Column(
        children: [
          DarkHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: AppColors.searchBarDark,
                  borderRadius: AppRadius.all(AppRadius.sm),
                  child: InkWell(
                    borderRadius: AppRadius.all(AppRadius.sm),
                    onTap: () => context.go(AppRoutes.login),
                    child: const Padding(
                      padding: EdgeInsets.all(AppSpacing.sm),
                      child: Icon(Icons.arrow_back,
                          size: 16, color: AppColors.textOnDark),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text('Forgot Password 🔑', style: AppTextStyles.title),
                const SizedBox(height: AppSpacing.xs),
                Text("We'll send a reset link to your email",
                    style: AppTextStyles.caption),
              ],
            ),
          ),
          Expanded(
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.sm),
                    Center(
                      child: Container(
                        width: 96,
                        height: 96,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: AppColors.keyCircle, shape: BoxShape.circle),
                        child: const Text('🔑', style: AppTextStyles.display),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Text('Enter your email address',
                        style: AppTextStyles.subheading),
                    const SizedBox(height: AppSpacing.xs),
                    Text("We'll send a secure link to reset your password.",
                        style: AppTextStyles.bodyMuted),
                    const SizedBox(height: AppSpacing.lg),
                    AppTextField(
                      hint: 'Enter email address',
                      icon: Icons.mail_outline,
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      fillColor: AppColors.surface,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    PrimaryButton(label: 'Send Reset Link →', onPressed: _sendLink),
                    const SizedBox(height: AppSpacing.md),
                    Center(
                      child: TextButton(
                        onPressed: () => context.go(AppRoutes.login),
                        child: Text('← Back to Sign In',
                            style: AppTextStyles.tiny.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
