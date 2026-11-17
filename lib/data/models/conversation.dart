import 'dart:ui';

class Conversation {
  const Conversation({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarColor,
    this.unread = 0,
    this.isOnline = false,
  });

  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final Color avatarColor;
  final int unread;
  final bool isOnline;

  String get initial => name.isEmpty ? '?' : name[0].toUpperCase();
}
