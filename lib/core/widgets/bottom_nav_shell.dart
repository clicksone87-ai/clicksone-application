import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Shared shell for Home / Services / Messages / Profile.
/// Branch order must match the order in app_router.dart.
class BottomNavShell extends StatelessWidget {
  const BottomNavShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  static const _items = [
    (Icons.home_rounded, 'Home'),
    (Icons.search_rounded, 'Services'),
    (Icons.chat_bubble_outline_rounded, 'Messages'),
    (Icons.person_outline_rounded, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final current = navigationShell.currentIndex;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
          boxShadow: [
            BoxShadow(color: AppColors.shadowSoft, blurRadius: 16, offset: Offset(0, -4))
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Row(
              children: [
                for (var i = 0; i < _items.length; i++)
                  Expanded(
                    child: InkWell(
                      onTap: () => navigationShell.goBranch(i,
                          initialLocation: i == current),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(_items[i].$1,
                                size: 24,
                                color: i == current
                                    ? AppColors.primary
                                    : AppColors.navInactive),
                            const SizedBox(height: 2),
                            Text(_items[i].$2,
                                style: AppTextStyles.tiny.copyWith(
                                    color: i == current
                                        ? AppColors.primary
                                        : AppColors.navInactive)),
                            const SizedBox(height: AppSpacing.xs),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: i == current
                                    ? AppColors.primary
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
