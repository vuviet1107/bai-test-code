import 'package:flutter/material.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_dimens.dart';
import 'package:untitled/constants/app_styles.dart';

class TimeTestShow extends StatefulWidget {
  const TimeTestShow({
    Key? key,
    required this.controller,
    this.validator,
    this.isTime = false,
    this.showSuffix = false,
    this.textInputAction,
    this.keyboardType,
    this.onChange,
    this.hintText,
    this.width = 150,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool isTime;
  final bool showSuffix;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function(String)? onChange;
  final String? hintText;
  final double width;

  @override
  State<TimeTestShow> createState() => _TimeTestShowState();
}

class _TimeTestShowState extends State<TimeTestShow> {
  String? selectedTime = 'hh:mm';

  @override
  Widget build(BuildContext context) {
    Future<void> openTimePicker(BuildContext context) async {
      final TimeOfDay? t = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (context, child) => MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child!));
      if (t != null) {
        setState(() {
          selectedTime = t.format(context);
          widget.controller!.text = selectedTime!;
        });
      }
    }

    return Container(
        height: 40,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          controller: widget.controller,
          onChanged: widget.onChange,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: widget.isTime,
          onTap: () {
            openTimePicker(context);
          },
          decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            filled: true,
            contentPadding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
            hintStyle: AppStyles.textW400(context,
                size: 14.0, color: AppColors.black6666),
            errorStyle: AppStyles.textW400(context,
                size: AppDimens.textSize12, color: AppColors.redColor),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColors.transparentColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: AppColors.transparentColor,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: AppColors.transparentColor,
                )),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: AppColors.transparentColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            hintText: selectedTime,
            suffixIcon: const Icon(
              Icons.access_time_outlined,
              color: AppColors.blueColor,
            ),
          ),
        ));
  }
}
