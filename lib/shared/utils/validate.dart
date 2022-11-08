import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';

  class Validate {
  static String? validatePhone(String value) {
    if (value == null || value.isEmpty) return 'Vui lòng nhập số điện thoại';

    // if (value.startsWith('84')) return 'Bạn nhập sai số điện thoại';

    if (RegExp(r'[.-]+').hasMatch(value)) {
      return 'Số điện thoại không chứa ký tự đặc biệt';
    }
    if (RegExp(r'[ ]+').hasMatch(value)) {
      return 'Số điện thoại không chứa khoảng trắng';
    }

    bool soban = RegExp(
        r'^(0|84)?((20[3-9])|(21[[0-9]])|(22[[0-2]])|(22[5-9])|(23[2-9])|(23[2-9])|(25[1-2])|(25[2-9])|(26[1-3])|(269)|(27[0-7])|(29[0-7])|(299))(\d{7})$')
        .hasMatch(value);
    if (!soban) {
      soban = RegExp(r'^(0|84)?((28)|(24))(\d{8})$').hasMatch(value);
    }
    bool sodd = RegExp(r'^(0|84)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\d{3})(\d{3})$').hasMatch(value);

    if (soban || sodd) {
      if (soban && value.length != 11) {
        return 'Số điện thoại không đúng định dạng';
      } else if (sodd && value.length != 10) {
        return 'Số điện thoại không đúng định dạng';
      }
    } else {
      return 'Số điện thoại không đúng định dạng';
    }

    return null;

    // if (value.trim().isEmpty || value.trim() == '' || value.trim().isEmpty) {
    //   return 'Số điện thoại không được để trống'.tr;
    // }
    // if (!RegExp(r'^((0[0-9])|(84[0-9]))\d{8,13}$').hasMatch(value.trim()) && value.trim().isNotEmpty) {
    //   return 'Số điện thoại không đúng định dạng';
    // }
    // if (value.trim().length < 10 || value.trim().length > 15) {
    //   return 'Số điện thoại không đúng định dạng'.tr;
    // }

    // return null;
  }

  static String? validateTexCode(String value) {
    var l = value.trim().length;
    if (!(l == 10 || l == 13)) {
      return 'Mã số thuế gồm 10 hoặc 13 ký tự';
    }

    // if (!RegExp(r'^((0[0-9])|(84[0-9]))\d{8,13}$').hasMatch(value.trim()) && value.trim().isNotEmpty) {
    //   return 'Mã số thuế gồm 10 hoặc 13 ký tự';
    // }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty || value.trim() == '') {
      return 'Email không được để trống'.tr;
    }
    if (!RegExp(r'^[a-z0-9.]*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?').hasMatch(value.trim()) &&
        value.trim().isNotEmpty) {
      return 'Email bạn nhập không hợp lệ';
    }
    return null;
  }

  static String? validateCharacterLimit(String value, String error) {
    if (value.trim().isEmpty || value.trim() == '' || value.trim().isEmpty) {
      return 'Vui lòng $error'.tr;
    }
    if (value.trim().length > 255) {
      return 'Tối đa 255 ký tự'.tr;
    }
    return null;
  }

  static String? validateCharacterMinimum(String value, String error) {
    if (value.trim().isEmpty || value.trim() == '' || value.trim().isEmpty) {
      return 'Vui lòng $error'.tr;
    }
    if (value.trim().length > 100) {
      return 'Tối thiểu 100 ký tự'.tr;
    }
    return null;
  }

  static String? validateNotEmpty(String value, String error) {
    return value.trim().isEmpty ? 'Vui lòng $error' : null;
  }

  //validate Mô tả, yêu cầu, quyền lợi trong đăng tin
  static String? validateRequest(String value, String value2, String value3, String error, String error2) {
    if (value.trim().isEmpty) return 'Vui lòng $error';
    if (value.trim() == value2.trim() || value.trim() == value3.trim()) return '$error2';
    return null;
  }

  //số lượng tuyển dụng
  static String? validateNumber(String value, String error) {
    if (value.trim().isEmpty) {
      return 'Vui lòng $error';
    }
    if (int.parse(value) <= 0) {
      return 'Số lượng tuyển dụng phải lớn hơn 0';
    }
    return null;
  }

  static String? validateTarget(String value, String error) {
    return value.trim() == "Nhập mục tiêu nghề nghiệp" ? 'Vui lòng $error' : null;
  }

  // static String? validateNotEmpty(String value) {
  //   return value.trim().isEmpty ? 'Mục này không được để trống' : null;
  // }

  static String? validateOtp(String value) {
    if (value.trim().isEmpty) {
      return "Vui lòng nhập OTP để xác thực";
    }
    if (value.trim().length < 7) {
      return "Mã OTP gồm 7 chữ số";
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.trim().isEmpty || value.trim() == '') {
      return 'Mật khẩu không được để trống';
    }

    if (value.trim().length < 6) {
      return 'Mật khẩu tối thiểu 6 ký tự, bao gồm chữ và số'.tr;
    }
    if (!RegExp(r'^(?=(.*?[a-z]{1,}))(?=.*?[0-9])').hasMatch(value.trim()) && value.trim().isNotEmpty) {
      return 'Mật khẩu ít nhất phải có 1 số và 1 chữ';
    }
    // if (RegExp(r'[.,!@#\$&*~^%()+x=/_€£¥₩÷]').hasMatch(value.trim()) && value.trim().isNotEmpty) {
    //   return 'Mật khẩu không được có ký tự đặc biệt';
    // }
    return null;
  }

  static String? validateNewPassword(String value, String value2) {
    if (value.trim().isEmpty) return 'Nhập lại mật khẩu không được để trống';
    if (value.trim() != value2.trim()) return 'Nhập lại mật khẩu không trùng khớp';
    return null;
  }

  static String? validateTitlePost(String value) {
    if (value.trim().isEmpty || value.trim() == '') {
      return 'Tiêu đề không được để trống';
    }
    if (RegExp(r'[%@$*.]').hasMatch(value.trim()) && value.trim().isNotEmpty) {
      return 'Tiêu đề không được có ký tự đặc biệt';
    }
    if (value.contains('Tuyển gấp ') || value.contains('hot ') || value.contains('cần gấp ') || value.contains('lương cao '))
      return 'KHÔNG được chứa: Tuyển gấp, hot, cần gấp, lương cao';
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Họ và tên không được để trống'.tr;
    }
    // else if (value.trim().length < 6) {
    //   return 'Họ và tên phải lớn hơn 6 ký tự'.tr;
    // }
    if (RegExp(r'[.,!@#\$&*~^%()+x=/_€£¥₩÷`|•√π×∆°{}℅?¢]').hasMatch(value.trim()) && value.trim().isNotEmpty) {
      return 'Họ tên không được chứa ký tự đặc biệt';
    }
    if (RegExp(r'[0-9]').hasMatch(value.trim()) && value.trim().isNotEmpty) {
      return 'Họ tên không được chứa số';
    }
    return null;
  }

  static String? validateNameCom(String value) {
    if (value.isEmpty) {
      return 'Tên công ty không được để trống'.tr;
    }
    if (RegExp(r'[.,!@#\$&*~^%()+=/_€£¥₩÷]').hasMatch(value.trim()) && value.trim().isNotEmpty) {
      return 'Tên công ty không được chứa ký tự đặc biệt';
    }
    return null;
  }

  static String? validateContent(String value) {
    if (value.trim().isEmpty || value.trim() == 'Nhập ít nhất 50 từ' || value.trim().isEmpty) {
      return 'Không được để trống'.tr;
    }
    if (value.trim().length < 50 || value.trim().length > 100) {
      return 'Nội dung hợp lệ từ 50-100 từ'.tr;
    }
    // if (!RegExp(r'^((0[0-9])|(84[0-9]))\d{8,10}$').hasMatch(value.trim()) && value.trim().isNotEmpty) {
    //   return 'Bạn nhập sai định dạng số điện thoại';
    // }
    return null;
  }

  static String? validateSkillAndTarget(String value, String error) {
    if (value.trim().length < 100) {
      return '$error tối thiểu 100 ký tự'.tr;
    }
    return null;
  }

  static String? validateFileSize(File? file, {double maxSizeInMb = 10}) {
    if (file != null) {
      try {
        int sizeInBytes = file.lengthSync();
        double sizeInMb = sizeInBytes / (1024 * 1024);
        if (sizeInMb > maxSizeInMb) {
          return 'Dung lượng ảnh không được vượt quá $maxSizeInMb MB';
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return null;
  }
}
