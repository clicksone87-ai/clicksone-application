import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_search_field.dart';
import '../../core/widgets/dark_header.dart';
import '../../data/models/conversation.dart';

// TODO: connect backend (conversations)
const _dummyConversations = [
  Conversation(
    id: '1',
    name: 'Clicks Team',
    lastMessage: 'Great! The logo looks amazing 🎉',
    time: '2m',
    avatarColor: AppColors.coral,
    unread: 2,
    isOnline: true,
  ),
];

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final items = _dummyConversations
        .where((c) => c.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
    final totalUnread = _dummyConversations.fold<int>(0, (s, c) => s + c.unread);

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: Column(
        children: [
          DarkHeader(
            child: Row(
              children: [
                const Expanded(
                    child: Text('Messages 💬', style: AppTextStyles.title)),
                if (totalUnread > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                    decoration: const BoxDecoration(
                        color: AppColors.badge, shape: BoxShape.circle),
                    child: Text('$totalUnread',
                        style: AppTextStyles.tiny
                            .copyWith(color: AppColors.textOnDark)),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: AppSearchField(
              hint: 'Search conversations...',
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, i) =>
                  const Divider(height: 1, color: AppColors.divider),
              itemBuilder: (context, i) => _ConversationTile(conversation: items[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConversationTile extends StatelessWidget {
  const _ConversationTile({required this.conversation});
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    final c = conversation;
    return InkWell(
      // TODO: open chat detail screen
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg, vertical: AppSpacing.md),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: c.avatarColor,
                  child: Text(c.initial,
                      style: AppTextStyles.heading
                          .copyWith(color: AppColors.textOnDark)),
                ),
                if (c.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.surface, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(c.name, style: AppTextStyles.subheading),
                  const SizedBox(height: 2),
                  Text(c.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyMuted),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(c.time, style: AppTextStyles.tiny),
                const SizedBox(height: AppSpacing.xs),
                if (c.unread > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm, vertical: 2),
                    decoration: const BoxDecoration(
                        color: AppColors.primary, shape: BoxShape.circle),
                    child: Text('${c.unread}',
                        style: AppTextStyles.tiny
                            .copyWith(color: AppColors.textOnDark)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
