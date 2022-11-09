import 'package:flutter/material.dart';
import 'package:untitled/constants/app_colors.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({
    Key? key,
    required this.prefixIcon,
    this.hinText,
    this.suffixIcon,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final String? hinText;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.transparent)),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: AppColors.blueColor,
          ),
          hintText: widget.hinText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
