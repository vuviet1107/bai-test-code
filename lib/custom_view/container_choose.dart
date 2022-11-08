import 'package:flutter/material.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_styles.dart';

class ContainerChoose extends StatelessWidget {
  const ContainerChoose({
    Key? key,
    this.title,
    this.icon,
    this.onPress,
    this.width,
    // this.style,
  }) : super(key: key);

  final String? title;
  final String? icon;
  final VoidCallback? onPress;
  final double? width;

  // final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16,),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Text(
              title ?? '',
              style: AppStyles.textW400(context,
                  size: 14, color: AppColors.black6666),
            ),
            const Spacer(),
            const Center(
                child: Icon(
              Icons.calendar_today_rounded,
              color: AppColors.blueColor,
            )),
          ],
        ),
      ),
    );
  }
}
