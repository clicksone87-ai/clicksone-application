import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/brand_logo.dart';
import '../../core/widgets/dark_header.dart';
import '../../core/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.startOnSignUp = false});
  final bool startOnSignUp;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _isSignIn = !widget.startOnSignUp;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    // TODO: connect backend (sign in / sign up)
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: Column(
        children: [
          DarkHeader(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.xl, AppSpacing.xxl, AppSpacing.xl, AppSpacing.xxxl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BrandLogo(size: 44),
                const SizedBox(height: AppSpacing.lg),
                Text(_isSignIn ? 'Welcome back! 👋' : 'Join Clicksone! 🎉',
                    style: AppTextStyles.title),
                const SizedBox(height: AppSpacing.xs),
                Text(
                    _isSignIn
                        ? 'Sign in to your creative universe'
                        : 'Create your creative account',
                    style: AppTextStyles.caption),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    children: [
                      _AuthToggle(
                          isSignIn: _isSignIn,
                          onChanged: (v) => setState(() => _isSignIn = v)),
                      const SizedBox(height: AppSpacing.lg),
                      if (!_isSignIn) ...[
                        AppTextField(
                            hint: 'Full name',
                            icon: Icons.person_outline,
                            controller: _name,
                            textInputAction: TextInputAction.next),
                        const SizedBox(height: AppSpacing.md),
                      ],
                      AppTextField(
                          hint: 'Email address',
                          icon: Icons.mail_outline,
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next),
                      const SizedBox(height: AppSpacing.md),
                      AppTextField(
                          hint: 'Password',
                          icon: Icons.lock_outline,
                          controller: _password,
                          obscureText: true),
                      if (_isSignIn)
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => context.push(AppRoutes.forgotPassword),
                            child: Text('Forgot Password?',
                                style: AppTextStyles.tiny.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600)),
                          ),
                        )
                      else
                        const SizedBox(height: AppSpacing.md),
                      PrimaryButton(
                          label: _isSignIn ? 'Sign In ✨' : 'Create Account ✨',
                          onPressed: _submit),
                      const SizedBox(height: AppSpacing.lg),
                      Text('— or continue with —', style: AppTextStyles.tiny),
                      const SizedBox(height: AppSpacing.lg),
                      Row(
                        children: [
                          Expanded(
                            child: _SocialButton(
                              label: 'G  Google',
                              background: AppColors.fieldFill,
                              foreground: AppColors.textPrimary,
                              border: AppColors.fieldBorder,
                              // TODO: connect backend (Google sign-in)
                              onTap: _submit,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: _SocialButton(
                              label: 'Apple',
                              background: AppColors.darkBg,
                              foreground: AppColors.textOnDark,
                              // TODO: connect backend (Apple sign-in)
                              onTap: _submit,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthToggle extends StatelessWidget {
  const _AuthToggle({required this.isSignIn, required this.onChanged});
  final bool isSignIn;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: AppRadius.all(AppRadius.pill),
        border: Border.all(color: AppColors.fieldBorder),
      ),
      child: Row(
        children: [
          _segment('Sign In', isSignIn, () => onChanged(true)),
          _segment('Sign Up', !isSignIn, () => onChanged(false)),
        ],
      ),
    );
  }

  Widget _segment(String label, bool selected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: AppRadius.all(AppRadius.pill),
          ),
          child: Text(label,
              style: AppTextStyles.label.copyWith(
                  color: selected ? AppColors.textOnDark : AppColors.textMuted)),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.label,
    required this.background,
    required this.foreground,
    required this.onTap,
    this.border,
  });
  final String label;
  final Color background;
  final Color foreground;
  final Color? border;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.all(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: background,
          borderRadius: AppRadius.all(AppRadius.md),
          border: border == null ? null : Border.all(color: border!),
        ),
        child: Text(label,
            style: AppTextStyles.body
                .copyWith(color: foreground, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
