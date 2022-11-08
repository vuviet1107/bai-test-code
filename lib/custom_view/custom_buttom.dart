import 'package:flutter/material.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.width = 156,
      this.title,
      this.onPress,
      this.color = AppColors.blueColor,
      this.textColor = AppColors.whiteColor})
      : super(key: key);

  final double? width;
  final String? title;
  final VoidCallback? onPress;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                blurRadius: 4, color: Colors.black26, offset: Offset(0, 2))
          ],
        ),
        child: Center(
            child: Text(
          title ?? '',
          style: AppStyles.textW400(context, size: 14, color: textColor),
        )),
      ),
    );
  }
}
