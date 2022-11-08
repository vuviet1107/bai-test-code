import 'dart:core';

import 'package:intl/intl.dart';

const PATTERN_1 = 'dd/MM/yy HH:mm';
const PATTERN_2 = 'dd/MM/yyyy';
const PATTERN_3 = 'HH:mm a';
const PATTERN_4 = 'HH:mm dd/MM/yy';
const PATTERN_5 = 'yyyy/MM/dd HH:mm';
const PATTERN_6 = 'yyyyMMddHHmmss';
const PATTERN_7 = 'dd/MM';

class ConvertValue {
  static String convertDateToCustom(DateTime date, String? style) {
    return DateFormat(style).format(date);
  }

  static String convertDateToString1(DateTime date) {
    return DateFormat(PATTERN_1).format(date);
  }

  static String convertDateToString3(DateTime date) {
    return DateFormat(PATTERN_3).format(date);
  }
  static String convertDateToString4(DateTime date) {
    return DateFormat(PATTERN_4).format(date);
  }

  static String convertDateToString5(DateTime date) {
    return DateFormat(PATTERN_5).format(date);
  }

  static String convertUIDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
  static DateTime convertTest(String date) {
    return DateFormat('dd/MM/yyyy').parse(date);
  }

  static String convertTime(time) {
    return DateFormat('HH:mm:ss, dd/MM/yyyy').format(DateTime.now());
  }
  static String convertDateText(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
  static String convertTimeString(String str) {
    return DateFormat('dd-MM-yyyy').format(DateFormat('dd/MM/yyyy').parse(str));
  }

  static String convertUIRangeDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String convertRequestDateFormString(String str) {
    return DateFormat('MM/dd/yyyy').format(DateFormat('dd/MM/yyyy').parse(str));
  }
  static String convertRequestDateForm(String str) {
    return DateFormat('dd/MM/yyyy').format(DateFormat('dd-MM-yyyy').parse(str));
  }

  static String convertRequestDate(DateTime date) {
    return DateFormat('yyyyMMddHHmmss').format(date);
  }

  static String convertDateToString6(DateTime date) {
    return DateFormat(PATTERN_6).format(date);
  }

  static String convertDateFormString(DateTime time) {
    return DateFormat('HH:mm:ss, dd/MM/yyyy').format(time);
  }

  static String convertDateToStringOrder(DateTime date) {
    return DateFormat(PATTERN_7).format(date);
  }

  static String convertDateToStringDate(String str) {
    return DateFormat('dd/MM').format(DateTime.parse(str.substring(0, 8) + 'T' + str.substring(8)));
  }

  static String convertDateToStringTime(String str) {
    return DateFormat('HH:mm').format(DateTime.parse(str.substring(0, 8) + 'T' + str.substring(8)));
  }
}
