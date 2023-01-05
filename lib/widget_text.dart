import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PillTextField12 extends StatelessWidget {
  const PillTextField12({
    // @required this.formKey,
    @required this.controller,
    // @required this.validator,
    this.readOnly = false,
    this.hintText,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.onChange,
    this.inputFormatters,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
  });

  // final Key? formKey;
  final TextEditingController? controller;
  final bool readOnly;

  // final String? Function(String?)? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onChanged: onChange,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        // validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 21),
          prefixIcon: prefixIcon,
          fillColor: Colors.transparent,
          filled: true,
          hintStyle: TextStyle(
              color: Colors.red, fontWeight: FontWeight.w700, fontSize: 16),
          errorStyle: TextStyle(
              color: Colors.yellow, fontWeight: FontWeight.w700, fontSize: 16),
          hintText: hintText,
          suffixIcon: suffixIcon,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.pink,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
            ),
          ),
        ));
  }
}
