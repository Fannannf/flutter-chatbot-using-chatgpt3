import 'package:chat_gpt/styles/app_color.dart';
import 'package:chat_gpt/styles/app_text.dart';
import 'package:flutter/material.dart';

Widget AppTextField(
  TextEditingController controller, {
  String label = "Username",
  String hintText = "Input your username",
  Icon? preffixIcon,
  bool obsureText = false,
}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppText.headline3,
        ),
        SizedBox(height: 10),
        Container(
          height: 47,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: AppText.textStyle4,
              filled: true, // Set filled to true by default
              fillColor: MaterialStateColor.resolveWith(
                (states) {
                  if (states.contains(MaterialState.focused)) {
                    return Colors
                        .transparent; // Set the fill color when focused
                  } else {
                    return AppColor
                        .textFieldColor; // Set the fill color when not focused
                  }
                },
              ),
              contentPadding: EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  width: 2,
                  color: AppColor.primaryColor,
                ),
              ),
              prefixIcon:
                  preffixIcon == null ? Icon(Icons.person) : preffixIcon,
              prefixIconColor: MaterialStateColor.resolveWith(
                (states) => states.contains(MaterialState.focused)
                    ? AppColor.primaryColor
                    : AppColor.blackColor.withOpacity(0.35),
              ),
            ),
            obscureText: obsureText,
          ),
        ),
      ],
    ),
  );
}
