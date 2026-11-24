import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/page_header.dart';
import '../providers/chat_provider.dart';
import '../../../profile/presentation/providers/profile_provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send(ChatProvider provider, [String? preset]) {
    final text = preset ?? _controller.text;
    provider.sendMessage(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChatProvider>();
    final userName = context.watch<ProfileProvider>().name;

    return Column(
      children: [
         PageHeader(
          title: 'AI First Aid Assistant',
          subtitle: 'Hi $userName! Your first aid learning assistant is ready.',
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.chatBlue.withOpacity(0.55),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Row(
            children: [
              Icon(Icons.science_outlined, color: AppColors.promptWine),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Prototype mode: replies are scripted examples, not live AI or medical advice.',
                  style: TextStyle(
                    color: AppColors.promptWine,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.messages.length,
            itemBuilder: (context, index) {
              final message = provider.messages[index];
              return Align(
                alignment: message.isUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.82,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? AppColors.promptWine
                        : AppColors.chatBlue,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isUser
                          ? AppColors.background
                          : AppColors.promptWine,
                      height: 1.4,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 42,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            children: [
              for (final prompt in [
                'What should I do for a burn?',
                'How to respond to bleeding?',
                'What is choking?',
              ])
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: ActionChip(
                    backgroundColor: AppColors.chatBlue.withOpacity(0.5),
                    label: Text(prompt, style: const TextStyle(fontSize: 11)),
                    onPressed: () => _send(provider, prompt),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  minLines: 1,
                  maxLines: 3,
                  onSubmitted: (_) => _send(provider),
                  decoration: const InputDecoration(
                    hintText: 'Ask a first aid question...',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: () => _send(provider),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.promptWine,
                  foregroundColor: AppColors.background,
                ),
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
