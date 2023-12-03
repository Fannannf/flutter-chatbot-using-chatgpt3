import 'package:chat_gpt/styles/app_color.dart';
import 'package:flutter/material.dart';

Widget AppSendMessage(
  TextEditingController _controller,
  BuildContext context, {
  VoidCallback? sendTextMessage,
  VoidCallback? sendVoiceMessage,
  bool sendIcon = false,
  void Function(String value)? funcSend,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.82,
        child: TextFormField(
          controller: _controller,
          onChanged: funcSend,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            hintText: "Input text...",
            contentPadding: EdgeInsets.all(10),
            filled: true,
            fillColor: AppColor.textFieldColor,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions_rounded,
                color: AppColor.blackColor.withOpacity(0.35),
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: sendIcon ? sendTextMessage : sendVoiceMessage,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColor.primaryColor,
          ),
          child: Center(
            child: sendIcon == false
                ? Icon(
                    Icons.mic,
                    color: AppColor.whiteColor,
                  )
                : Icon(
                    Icons.send,
                    color: AppColor.whiteColor,
                  ),
          ),
        ),
      ),
    ],
  );
}
