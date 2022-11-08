import 'package:flutter/material.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_styles.dart';

class TextRequired extends StatelessWidget {
  const TextRequired({
    Key? key,
    this.text,
    this.required = false,
  }) : super(key: key);

  final String? text;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text ?? '',
          style: AppStyles.textW400(context,
              size: 16, color: AppColors.blackColor),
        ),
        if (required == true)
          Text(
            ' (*)',
            style: AppStyles.textW400(context,
                size: 16, color: AppColors.redColor),
          )
      ],
    );
  }
}
