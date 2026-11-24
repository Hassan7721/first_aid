import 'package:flutter/foundation.dart';
import '../../data/models/chat_message.dart';
import '../../data/services/local_chat_service.dart';

class ChatProvider extends ChangeNotifier {
  ChatProvider() : _service = LocalChatService() {
    _messages.add(
      const ChatMessage(
        text: 'Hi! I am the FirstAid AI demo assistant. I can help you explore general first-aid learning topics. If someone is in immediate danger, contact emergency services now.',
        isUser: false,
      ),
    );
  }

  final LocalChatService _service;
  final List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => List.unmodifiable(_messages);

  void sendMessage(String input) {
    final text = input.trim();
    if (text.isEmpty) return;

    _messages.add(ChatMessage(text: text, isUser: true));
    _messages.add(
      ChatMessage(
        text: _service.getReply(text),
        isUser: false,
      ),
    );
    notifyListeners();
  }

  void clearChat() {
    _messages
      ..clear()
      ..add(
        const ChatMessage(
          text: 'Chat cleared. How can I help you learn about first aid?',
          isUser: false,
        ),
      );
    notifyListeners();
  }
}
