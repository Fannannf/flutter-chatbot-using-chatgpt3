import 'package:chat_gpt/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatProvider extends StateNotifier<List<ChatModel>> {
  ChatProvider() : super([]);
  void add(ChatModel chatModel) {
    state = [...state, chatModel];
  }

  void removeTyping() {
    state = state..removeWhere((chat) => chat.id == 'typing');
  }
}

final chatsProvider = StateNotifierProvider<ChatProvider, List<ChatModel>>(
  (ref) => ChatProvider(),
);
