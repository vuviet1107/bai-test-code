import 'package:flutter/material.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/custom_view/text_field_custom.dart';

class AddDocument extends StatefulWidget {
  const AddDocument({
    Key? key,
    required this.textSymbols,
    required this.nameText,
    required this.dayText,
    required this.note,
    this.onTap,
  }) : super(key: key);

  final TextEditingController textSymbols;
  final TextEditingController nameText;
  final TextEditingController dayText;
  final TextEditingController note;
  final VoidCallback? onTap;

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: widget.onTap,
          child: const Icon(
            Icons.cancel_rounded,
            color: AppColors.redColor,
          ),
        ),
        TextFieldCustom(
          prefixIcon: Icons.translate,
          hinText: 'Mã/Số ký hiệu văn bản',
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
          controller: widget.textSymbols,
        ),
        const Divider(
          height: 2,
          color: AppColors.blueColor,
          endIndent: 10,
          indent: 10,
        ),
        TextFieldCustom(
          prefixIcon: Icons.text_snippet_outlined,
          hinText: 'Tên văn bản',
          controller: widget.nameText,
        ),
        const Divider(
          height: 2,
          color: AppColors.blueColor,
          endIndent: 10,
          indent: 10,
        ),
        TextFieldCustom(
          prefixIcon: Icons.calendar_today_rounded,
          hinText: 'Ngày văn bản',
          controller: widget.dayText,
        ),
        const Divider(
          height: 2,
          color: AppColors.blueColor,
          endIndent: 10,
          indent: 10,
        ),
        TextFieldCustom(
          hinText: 'Ghi chú',
          prefixIcon: Icons.event_note_outlined,
          controller: widget.note,
        ),
      ],
    );
  }
}
