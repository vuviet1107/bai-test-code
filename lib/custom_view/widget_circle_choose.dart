import 'package:flutter/material.dart';
import 'package:untitled/constants/app_colors.dart';

class WidgetCircleChoose extends StatefulWidget {
  const WidgetCircleChoose({
    Key? key,
    this.title,
    this.onPress,
    this.id,
    this.idList,
  }) : super(key: key);

  final String? title;
  final VoidCallback? onPress;
  final String? id;

  final String? idList;

  @override
  State<WidgetCircleChoose> createState() => _WidgetCircleChooseState();
}

class _WidgetCircleChooseState extends State<WidgetCircleChoose> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: widget.onPress,
        child: Row(
          children: [
            Icon(widget.id == widget.idList
                ? Icons.check_box
                : Icons.check_box_outline_blank),
            const SizedBox(width: 16),
            Text(
              widget.title ?? '',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: widget.id == widget.idList
                      ? AppColors.blueColor
                      : AppColors.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
