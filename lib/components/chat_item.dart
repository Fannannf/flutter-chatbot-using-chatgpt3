import 'package:chat_gpt/styles/app_color.dart';
import 'package:chat_gpt/styles/app_text.dart';
import 'package:flutter/material.dart';

class AppChatItem extends StatelessWidget {
  String text;
  final bool isMe;
  AppChatItem({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) Profile(isMe: isMe),
          if (!isMe) const SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(10),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6),
            decoration: BoxDecoration(
              color: isMe
                  ? AppColor.primaryColor
                  : AppColor.blackColor.withOpacity(0.70),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(isMe ? 15 : 0),
                bottomRight: Radius.circular(isMe ? 0 : 15),
              ),
            ),
            child: Text(
              text,
              style: AppText.textStyle3.copyWith(color: AppColor.whiteColor),
            ),
          ),
          if (isMe) const SizedBox(width: 10),
          if (isMe) Profile(isMe: isMe),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.isMe,
  });

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isMe
            ? AppColor.primaryColor
            : AppColor.blackColor.withOpacity(0.70),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        isMe ? Icons.person : Icons.computer_rounded,
        color: AppColor.whiteColor,
        size: 20,
      ),
    );
  }
}
