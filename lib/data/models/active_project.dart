class ActiveProject {
  const ActiveProject({
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  final String title;
  final String subtitle;

  /// 0.0 – 1.0
  final double progress;
}
