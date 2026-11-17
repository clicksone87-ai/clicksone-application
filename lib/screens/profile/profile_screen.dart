import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/dark_header.dart';
import '../../data/models/active_service.dart';

// TODO: connect backend (client profile + active services)
const _dummyServices = [
  ActiveService(
      emoji: '🎨',
      name: 'Logo & Brand Identity',
      priceFrom: 'From \$25',
      tileColor: AppColors.primary),
  ActiveService(
      emoji: '💻',
      name: 'Web Design & Dev',
      priceFrom: 'From \$80',
      tileColor: AppColors.coral),
  ActiveService(
      emoji: '📱',
      name: 'Social Media Design',
      priceFrom: 'From \$15',
      tileColor: AppColors.success),
  ActiveService(
      emoji: '🎬',
      name: 'Video Editing',
      priceFrom: 'From \$30',
      tileColor: AppColors.amber),
];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: Column(
        children: [
          DarkHeader(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Material(
                    color: AppColors.searchBarDark,
                    borderRadius: AppRadius.all(AppRadius.sm),
                    child: InkWell(
                      borderRadius: AppRadius.all(AppRadius.sm),
                      // TODO: open settings
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(AppSpacing.sm),
                        child: Icon(Icons.settings,
                            size: 18, color: AppColors.textOnDarkMuted),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: AppSpacing.lg),
                    const _Avatar(),
                    const SizedBox(height: AppSpacing.md),
                    Text('Clients name',
                        style: AppTextStyles.heading
                            .copyWith(color: AppColors.textOnDark)),
                    const SizedBox(height: AppSpacing.xs),
                    Text('@mail  ·  Rawalpindi, PK', style: AppTextStyles.caption),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                Text('Active Services', style: AppTextStyles.heading),
                const SizedBox(height: AppSpacing.md),
                for (final s in _dummyServices) _ServiceCard(service: s),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 72,
          height: 72,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.amber, width: 3),
          ),
          child: Text('A',
              style: AppTextStyles.title.copyWith(color: AppColors.textOnDark)),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.darkBg, width: 2),
            ),
            child: const Icon(Icons.check, size: 12, color: AppColors.textOnDark),
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service});
  final ActiveService service;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.all(AppRadius.md),
        boxShadow: const [
          BoxShadow(color: AppColors.shadowSoft, blurRadius: 10, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: service.tileColor, borderRadius: AppRadius.all(AppRadius.sm)),
            child: Text(service.emoji, style: AppTextStyles.subheading),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(service.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)),
                Text(service.priceFrom, style: AppTextStyles.tiny),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: AppSpacing.xs),
            decoration: BoxDecoration(
                color: AppColors.successBg,
                borderRadius: AppRadius.all(AppRadius.pill)),
            child: Text(service.status,
                style: AppTextStyles.tiny.copyWith(
                    color: AppColors.successText, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
