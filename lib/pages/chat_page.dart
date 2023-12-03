import 'package:chat_gpt/components/app_sendmessage.dart';
import 'package:chat_gpt/components/app_textfield.dart';
import 'package:chat_gpt/components/chat_item.dart';
import 'package:chat_gpt/providers/auth_providers.dart';
import 'package:chat_gpt/providers/chat_providers.dart';
import 'package:chat_gpt/services/ai_handler.dart';
import 'package:chat_gpt/services/voice_handler.dart';
import 'package:chat_gpt/styles/app_color.dart';
import 'package:chat_gpt/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/chat_model.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final AIHandler _openAI = AIHandler();
  final VoiceHandler voiceHandler = VoiceHandler();
  bool sendIcon = false;

  @override
  void initState() {
    voiceHandler.initSpeech();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _openAI.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final _auth = ref.watch(authenticationProvider);
        final chats = ref.watch(chatsProvider).reversed.toList();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "ChatLove.",
              style: AppText.headline2.copyWith(color: AppColor.whiteColor),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.primaryColor,
            actions: [
              IconButton(
                onPressed: () => _auth.signOut(),
                icon: Icon(
                  Icons.logout_rounded,
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: chats.length,
                  itemBuilder: (context, index) => AppChatItem(
                    text: chats[index].message,
                    isMe: chats[index].isMe,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: AppSendMessage(
                  _controller,
                  context,
                  sendIcon: sendIcon,
                  funcSend: (value) {
                    value.isNotEmpty
                        ? setState(() {
                            sendIcon = true;
                          })
                        : setState(() {
                            sendIcon = false;
                          });
                  },
                  sendTextMessage: () {
                    final message = _controller.text;
                    _controller.clear();
                    sendTextMessage(message);
                  },
                  sendVoiceMessage: sendVoiceMessage,
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        );
      },
    );
  }

  void sendVoiceMessage() async {
    if (!voiceHandler.isEnabled) {
      print('Not supported');
      return;
    }
    if (voiceHandler.speechToText.isListening) {
      await voiceHandler.stopListening();
    } else {
      final result = await voiceHandler.startListening();
      sendTextMessage(result);
    }
  }

  void sendTextMessage(String message) async {
    addToChatList(message, true, DateTime.now().toString());
    addToChatList('Typing...', false, 'typing');
    final aiResponse = await _openAI.getResponse(message);
    removeTyping();
    sendIcon = false;
    addToChatList(aiResponse, false, DateTime.now().toString());
  }

  void removeTyping() {
    final chats = ref.read(chatsProvider.notifier);
    chats.removeTyping();
  }

  void addToChatList(String message, bool isMe, String id) {
    final chats = ref.read(chatsProvider.notifier);
    chats.add(ChatModel(
      id: id,
      message: message,
      isMe: isMe,
    ));
  }
}
