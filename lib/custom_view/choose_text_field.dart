import 'package:flutter/material.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_dimens.dart';
import 'package:untitled/constants/app_styles.dart';

class ChooseTextField extends StatefulWidget {
  const ChooseTextField({
    this.controller,
    this.hintText,
    this.onPress,
    this.onChange,
  });

  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback? onPress;
  final Function(String)? onChange;

  @override
  _ChooseTextFieldState createState() => _ChooseTextFieldState();
}

class _ChooseTextFieldState extends State<ChooseTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Stack(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          TextFormField(
              controller: widget.controller,
              onChanged: widget.onChange,
              readOnly: true,
              onTap: widget.onPress,
              decoration: InputDecoration(
                fillColor: AppColors.whiteColor,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                hintStyle: AppStyles.textW400(context,
                    size: 14.0, color: AppColors.black6666),
                errorStyle: AppStyles.textW400(context,
                    size: AppDimens.textSize12, color: AppColors.redColor),
                hintText: widget.hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.transparent)),
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
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Colors.red)),
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ))
        ],
      ),
    );
  }
}
