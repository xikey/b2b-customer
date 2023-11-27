class Validator {
  static String? iranMobileValidation(String? input) {
    if (input == null) {
      return 'شماره موبایل را وارد نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'شماره موبایل را وارد نمایید';
    }

    if (input.length != 11 && input.length != 13) {
      return 'فرمت شماره موبایل ورودی اشتباه است';
    }

    if (input.length == 13) {
      if (!input.startsWith('+989')) {
        return 'فرمت شماره موبایل ورودی اشتباه است';
      } else {
        return null;
      }
    }

    if (input.length == 11) {
      if (!input.startsWith('09')) {
        return 'فرمت شماره موبایل ورودی اشتباه است';
      } else {
        return null;
      }
    }

    return null;
  }

  static String? userValidator(String? input) {
    if (input == null) {
      return 'کد کاربری را وارد نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'کد کاربری را وارد نمایید';
    }

    return null;
  }

  static String? smsCodeValidator(String? input) {
    if (input == null) {
      return 'کد دریافتی را وارد نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'کد دریافتی را وارد نمایید';
    }

    return null;
  }


  static String? nameValidator(String? input) {
    if (input == null) {
      return 'نام را وارد نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'نام را وارد نمایید';
    }

    return null;
  }

  static String? jobCategoryValidator(String? input) {
    if (input == null) {
      return 'فیلد کاری را وارد نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'فیلد کاری را وارد نمایید';
    }

    return null;
  }

  static String? serviceValidator(String? input) {
    if (input == null) {
      return 'نوع خدمت را انتخاب نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'نوع خدمت را انتخاب نمایید';
    }

    return null;
  }

  static String? startTime(String? input) {
    if (input == null) {
      return 'ساعت شروع را انتخاب نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'ساعت شروع را انتخاب نمایید';
    }

    return null;
  }

  static String? passwordValidator(String? input) {
    if (input == null) {
      return 'کلمه عبور را وارد نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'کلمه عبور را وارد نمایید';
    }

    if (input.trim().length < 4) {
      return 'حد اقل کلمه عبور 4 رقم میباشد';
    }

    return null;
  }

  static String? priceValidator(String? input) {
    if (input == null) {
      return 'مبلغ را وارد نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'مبلغ را وارد نمایید';
    }

    try {
      final int priceTemp = int.parse(input.trim());
      if (priceTemp <= 0) {
        return 'مبلغ نادرست میباشد';
      }
    } catch (e) {
      return 'مبلغ نادرست میباشد';
    }

    return null;
  }

  static String? prepaymentValidator(String? input) {
    if (input == null) {
      return 'مبلغ را وارد نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'مبلغ را وارد نمایید';
    }

    try {
      final int priceTemp = int.parse(input.trim());
      if (priceTemp < 0) {
        return 'مبلغ نادرست میباشد';
      }
    } catch (e) {
      return 'مبلغ نادرست میباشد';
    }

    return null;
  }

  static String? durationValidator(String? input) {
    if (input == null) {
      return 'زمان را وارد نمایید';
    }

    if (input.isEmpty || input.trim().isEmpty) {
      return 'زمان را وارد نمایید';
    }

    try {
      final int priceTemp = int.parse(input.trim());
      if (priceTemp < 0) {
        return 'زمان نادرست میباشد';
      }
    } catch (e) {
      return 'زمان نادرست میباشد';
    }

    return null;
  }
}
