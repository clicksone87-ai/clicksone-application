import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_search_field.dart';
import '../../core/widgets/dark_header.dart';
import '../../data/models/active_project.dart';

// TODO: connect backend (current project)
const _dummyProject = ActiveProject(
  title: '🚀 Active Project',
  subtitle: 'Brand Identity for TechCorp — In Progress',
  progress: 0.6,
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Text('Good morning ☀️',
                    style: AppTextStyles.caption
                        .copyWith(color: AppColors.textOnDark)),
                const SizedBox(height: AppSpacing.xs),
                const Text('Clicks Studio 🎨', style: AppTextStyles.title),
                const SizedBox(height: AppSpacing.md),
                const AppSearchField(hint: 'Search services...', dark: true),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: const [_ActiveProjectCard(project: _dummyProject)],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActiveProjectCard extends StatelessWidget {
  const _ActiveProjectCard({required this.project});
  final ActiveProject project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: AppRadius.all(AppRadius.lg),
        boxShadow: const [
          BoxShadow(
              color: AppColors.primaryShadow, blurRadius: 18, offset: Offset(0, 6))
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                  color: AppColors.amber, borderRadius: AppRadius.all(AppRadius.pill)),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project.title,
                      style: AppTextStyles.subheading
                          .copyWith(color: AppColors.textOnDark)),
                  const SizedBox(height: AppSpacing.xs),
                  Text(project.subtitle, style: AppTextStyles.caption),
                  const SizedBox(height: AppSpacing.md),
                  ClipRRect(
                    borderRadius: AppRadius.all(AppRadius.pill),
                    child: LinearProgressIndicator(
                      value: project.progress,
                      minHeight: 4,
                      color: AppColors.amber,
                      backgroundColor: AppColors.progressTrack,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
