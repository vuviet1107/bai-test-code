import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_dimens.dart';
import 'package:untitled/constants/app_styles.dart';

class TextFieldNoneValidate extends StatefulWidget {
  const TextFieldNoneValidate({
    @required this.controller,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.onChange,
    this.inputFormatters,
    this.onButtonFormChange,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onButtonFormChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  _TextFieldNoneValidateState createState() => _TextFieldNoneValidateState();
}

class _TextFieldNoneValidateState extends State<TextFieldNoneValidate> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      setStateIfMounted(() {
        _showClearButton = widget.controller!.text.isNotEmpty;
      });
    });
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  Widget _getClearButton() {
    if (!_showClearButton) return const SizedBox.shrink();
    return IconButton(
        onPressed: () {
          widget.controller?.clear();
          if (widget.onButtonFormChange != null) widget.onButtonFormChange!();
        },
        icon: const Icon(Icons.clear));
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          TextFormField(
              controller: widget.controller,
              onChanged: widget.onChange,
              textInputAction: widget.textInputAction,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // readOnly: widget.isDate,
              // onTap: _getOnTap,
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
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
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Colors.red)),
                suffixIcon: widget.suffixIcon
              ))
        ],
      ),
    );
  }
}
