import 'package:flutter/material.dart';
import 'package:movie_app_riverpod/src/utils/theme.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? minLines;
  final int? maxLength;
  final int? maxLines;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.minLines,
      this.maxLines,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: ThemeConfig.blueColor
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12)),
    );
  }
}