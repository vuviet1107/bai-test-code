import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_dimens.dart';
import 'package:untitled/constants/app_styles.dart';

class PillTextField extends StatefulWidget {
  const PillTextField({
    @required this.formKey,
    @required this.controller,
    @required this.validator,
    this.isPassword = false,
    this.hintText,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.onChange,
    this.inputFormatters,
    this.onButtonFormChange,
    this.showSuffix = false,
    this.suffix,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
  });

  final Key? formKey;
  final TextEditingController? controller;
  final bool isPassword;
  final bool showSuffix;
  final String? suffix;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onButtonFormChange;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  _PillTextFieldState createState() => _PillTextFieldState();
}

class _PillTextFieldState extends State<PillTextField> {
  bool _showClearButton = false;
  bool _showPassword = false;

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

  // Widget _getClearButton() {
  //   if (!_showClearButton) return const SizedBox.shrink();
  //   return IconButton(
  //       onPressed: () {
  //         widget.controller?.clear();
  //         if (widget.onButtonFormChange != null) widget.onButtonFormChange!();
  //       },
  //       icon: const Icon(Icons.clear));
  // }

  _getPasswordButton() {
    if (!widget.isPassword) return const SizedBox.shrink();
    return IconButton(
      onPressed: () {
        setState(() {
          _showPassword = !_showPassword;
        });
      },
      icon: Icon(
        _showPassword ? Icons.search : Icons.keyboard_arrow_down,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Stack(
        children: [
          Container(
            height: 40,
            width: AppDimens.width * 0.89,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Form(
            key: widget.formKey!,
            child: TextFormField(
                controller: widget.controller,
                onChanged: widget.onChange,
                textInputAction: widget.textInputAction,
                textCapitalization: widget.textCapitalization,
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                validator: widget.validator,
                obscureText: widget.isPassword && !_showPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // readOnly: widget.isDate,
                // onTap: _getOnTap,
                decoration: InputDecoration(
                  // prefix: const SizedBox(
                  //   height: 10,
                  //   width: 2,
                  //   child: VerticalDivider(color: AppColors.blueColor),
                  // ),
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
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      )),
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
                  suffixIcon: widget.suffixIcon,
                  suffixText: widget.showSuffix ? widget.suffix : null,
                )),
          )
        ],
      ),
    );
  }
}
