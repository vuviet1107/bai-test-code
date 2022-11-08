import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_dimens.dart';
import 'package:untitled/constants/app_styles.dart';
import 'package:untitled/shared/utils/convert.dart';

class DateText extends StatefulWidget {
  DateText({
    @required this.controller,
    this.validator,
    this.isDate = false,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.onChange,
    this.inputFormatters,
    this.onButtonFormChange,
    this.showSuffix = false,
    this.suffix,
    this.onTap,
    this.width = 150,
     this.test,
  });

  final TextEditingController? controller;
  final bool isDate;
  final bool showSuffix;
  final String? suffix;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onButtonFormChange;
  final VoidCallback? onTap;
  final double? width;
  final DateTime? test;

  @override
  _DateTextState createState() => _DateTextState();
}

class _DateTextState extends State<DateText> {
  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      if (widget.onButtonFormChange != null) widget.onButtonFormChange!();
    });
  }

  showCustomDatePicker() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: widget.test ?? DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((value) {
      widget.controller!.text = ConvertValue.convertDateText(value!);
    });
  }

  _getOnTap() async {
    if (widget.isDate) {
      showCustomDatePicker();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          // Image.asset(Res.image_background,width: AppDimens.width, height: 75,),
          Container(
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
                  inputFormatters: widget.inputFormatters,
                  validator: widget.validator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  readOnly: widget.isDate,
                  onTap: _getOnTap,
                  decoration: InputDecoration(
                    fillColor: AppColors.whiteColor,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(left: 10, top: 8, bottom: 8),
                    hintStyle: AppStyles.textW400(context,
                        size: 14.0, color: AppColors.black6666),
                    errorStyle: AppStyles.textW400(context,
                        size: AppDimens.textSize12, color: AppColors.redColor),
                    hintText: widget.hintText,
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
                      borderSide:
                          const BorderSide(color: AppColors.transparentColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    suffixIcon: const Icon(
                      Icons.calendar_today_rounded,
                      color: AppColors.blueColor,
                    ),
                    suffixText: widget.showSuffix ? widget.suffix : null,
                  ))),
        ],
      ),
    );
  }
}
