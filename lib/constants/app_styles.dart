import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimens.dart';

class AppStyles {
  static const FontWeight w300 = FontWeight.w300;
  static const FontWeight w400 = FontWeight.w400;
  static const FontWeight w500 = FontWeight.w500;
  static const FontWeight w600 = FontWeight.w600;
  static const FontWeight w700 = FontWeight.w700;
  static const FontWeight w800 = FontWeight.w800;

  static TextStyle textW300(BuildContext context,
      {@required double? size,
        FontStyle? fontStyle,
        Color? color = AppColors.blackColor,
        double? lineHeight = AppDimens.lineHeight16}) {
    var height = 1.0;
    if (lineHeight! > size!) {
      height = lineHeight / size;
    }
    return Theme.of(context).textTheme.subtitle1!.copyWith(
        fontSize: size, fontWeight: w300, color: color, height: height);
  }
  static TextStyle textW400(BuildContext context,
      {@required double? size,
        FontStyle? fontStyle,
        Color? color = AppColors.blackColor,
        double? lineHeight = AppDimens.lineHeight16}) {
    var height = 1.0;
    if (lineHeight! > size!) {
      height = lineHeight / size;
    }
    return Theme.of(context).textTheme.subtitle1!.copyWith(
        fontSize: size, fontWeight: w400, color: color, height: height);
  }

  static TextStyle textW500(BuildContext context,
      {@required double? size,
        FontStyle? fontStyle,
        Color? color = AppColors.blackColor,
        double? lineHeight = AppDimens.lineHeight16}) {
    var height = 1.0;
    if (lineHeight! > size!) {
      height = lineHeight / size;
    }
    return Theme.of(context).textTheme.subtitle1!.copyWith(
        fontSize: size, fontWeight: w500, color: color, height: height);
  }

  static TextStyle textW600(BuildContext context,
      {@required double? size,
        FontStyle? fontStyle,
        Color? color = AppColors.blackColor,
        double? lineHeight = AppDimens.lineHeight16}) {
    var height = 1.0;
    if (lineHeight! > size!) {
      height = lineHeight / size;
    }
    return Theme.of(context).textTheme.subtitle1!.copyWith(
        fontSize: size, fontWeight: w600, color: color, height: height);
  }

  static TextStyle textW700(BuildContext context,
      {@required double? size,
        FontStyle? fontStyle,
        Color? color = AppColors.blackColor,
        double? lineHeight = AppDimens.lineHeight16}) {
    var height = 1.0;
    if (lineHeight! > size!) {
      height = lineHeight / size;
    }
    return Theme.of(context).textTheme.subtitle1!.copyWith(
        fontSize: size, fontWeight: w700, color: color, height: height);
  }

  static TextStyle textW800(BuildContext context,
      {@required double? size,
        FontStyle? fontStyle,
        Color? color = AppColors.blackColor,
        double? lineHeight = AppDimens.lineHeight16}) {
    var height = 1.0;
    if (lineHeight! > size!) {
      height = lineHeight / size;
    }
    return Theme.of(context).textTheme.subtitle1!.copyWith(
        fontSize: size, fontWeight: w800, color: color, height: height);
  }
}
