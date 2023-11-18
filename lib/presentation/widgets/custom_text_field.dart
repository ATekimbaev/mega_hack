import 'package:flutter/material.dart';
import 'package:mega_hack_app/presentation/theme/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppFonts.s14w500,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: AppFonts.s14w500,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD9D9D9),
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
