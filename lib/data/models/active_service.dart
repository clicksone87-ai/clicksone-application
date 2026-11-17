import 'dart:ui';

class ActiveService {
  const ActiveService({
    required this.emoji,
    required this.name,
    required this.priceFrom,
    required this.tileColor,
    this.status = 'Active',
  });

  final String emoji;
  final String name;
  final String priceFrom;
  final Color tileColor;
  final String status;
}
