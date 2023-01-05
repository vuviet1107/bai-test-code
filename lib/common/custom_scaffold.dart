import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:untitled/constants/app_colors.dart';
import 'package:untitled/constants/app_styles.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    this.titleFontSize,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.backgroundColor,
    required this.body,
    this.bottomNavigationBar,
  });

  final String title;
  final double? titleFontSize;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget body;
  final Widget? bottomNavigationBar;

  void _handleBackButton() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: !automaticallyImplyLeading
            ? null
            : IconButton(
                icon: const Icon(
                  Remix.arrow_left_s_line,
                  size: 24,
                  color: AppColors.redColor,
                ),
                iconSize: 24,
                padding: const EdgeInsets.only(left: 16, right: 8),
                onPressed: _handleBackButton,
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              ),
        leadingWidth: 48,
        title: Text(title.toUpperCase(),
            style: AppStyles.textW700(context,
                size: 15, color: AppColors.greenColor)),
        centerTitle: true,
        toolbarHeight: 43,
        backgroundColor: AppColors.greyColor,
        elevation: 0,
        actions: actions,
      ),
      backgroundColor: backgroundColor ?? AppColors.background,
      body: body,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomNavigationBar == null
          ? null
          : SafeArea(
              top: false,
              child: bottomNavigationBar!,
            ),
    );
  }
}
