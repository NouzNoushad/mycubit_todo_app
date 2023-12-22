import 'package:custom_statemanagement_todo/utils/colors.dart';
import 'package:flutter/material.dart';

class TodoTextFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController? controller;
  const TodoTextFormField(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      autocorrect: false,
      style: TextStyle(color: ColorPicker.whiteColor, decorationThickness: 0.0),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: ColorPicker.whiteColor),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.5, color: ColorPicker.whiteColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.5, color: ColorPicker.whiteColor)),
      ),
    );
  }
}
