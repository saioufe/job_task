import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/locale.dart';

enum LockKeys {
  login,
  register,
  quickLogin,
  touchId,
  enterName,
  enterPassword,
  forgetPassword
}

class AppLocalization {
  static AppLocalization of(BuildContext ctx) {
    return Localizations.of<AppLocalization>(ctx, AppLocalization);
  }

  static Map<String, Map<LockKeys, String>> _db = {
    "en": {
      LockKeys.login: "Login",
      LockKeys.register: "Register",
      LockKeys.quickLogin: "Now! Quick login use your touch ID",
      LockKeys.touchId: "USE TOUCH ID",
      LockKeys.enterName: "Enter your name",
      LockKeys.enterPassword: "Enter your Password",
    },
    "ar": {
      LockKeys.login: "تسجيل الدخول",
      LockKeys.register: "التسجيل",
      LockKeys.quickLogin: "الان! للتسجيل السريع استخدم بصمة اليد",
      LockKeys.touchId: "استخدم بصمة اليد",
      LockKeys.enterName: "ادخل الاسم",
      LockKeys.enterPassword: "ادخل كلمة المرور",
    },
  };

  String localize(LockKeys value) {
    final code = PlatformDispatcher.instance.locale.languageCode;

    print(code);

    if (_db.containsKey(code)) {
      return _db[code][value] ?? "-";
    } else {
      return _db["ar"][value] ?? "-";
    }
  }
}
