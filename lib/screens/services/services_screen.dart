import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/dark_header.dart';

/// Placeholder: the Services tab isn't in the 6 screens yet.
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightBg,
      body: Column(
        children: [
          DarkHeader(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Services', style: AppTextStyles.title))),
          Expanded(
              child: Center(
                  child: Text('Coming soon', style: AppTextStyles.bodyMuted))),
        ],
      ),
    );
  }
}
