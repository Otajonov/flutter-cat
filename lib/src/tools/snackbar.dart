import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackyType {info, success, warning, error}

class Snacky {
  static void error(String message, {String title = "", Duration duration = const Duration(seconds: 10)}) {
    showSnackbar(message, title, SnackyType.error, duration);
  }

  static void info(String message, {String title = "", Duration duration = const Duration(seconds: 10)}) {
    showSnackbar(message, title, SnackyType.info, duration);
  }

  static void warning(String message, {String title = "", Duration duration = const Duration(seconds: 10)}) {
    showSnackbar(message, title, SnackyType.warning, duration);
  }

  static void success(String message, {String title = "", Duration duration = const Duration(seconds: 10)}) {
    showSnackbar(message, title, SnackyType.success, duration);
  }

  static void showSnackbar(String message, String title, SnackyType type, Duration duration) {
    Get.closeCurrentSnackbar();

    Get.snackbar(
      title.isEmpty ? message : title,
      title.isEmpty ? "" : message,
      icon: type != SnackyType.info
          ? type != SnackyType.error
          ? type != SnackyType.success
          ? const Icon(Icons.warning_amber, color: Colors.white)
          : const Icon(Icons.check, color: Colors.white )
          : const Icon(Icons.error_outline, color: Colors.white)
          : const Icon(Icons.info_outline, color: Colors.white),
      duration: duration,
      animationDuration: const Duration(milliseconds: 300),
      forwardAnimationCurve: Curves.easeOutBack,
      margin: EdgeInsets.only( left: Get.width > Get.height ? Get.width / 2 : 10, right: 10, top: 20),
      padding: const EdgeInsets.all(10),
      dismissDirection: DismissDirection.horizontal,
      isDismissible: true,
      colorText: Colors.white,
      backgroundColor: Colors.blueGrey,
      backgroundGradient: type != SnackyType.info
          ? type != SnackyType.error
          ? type != SnackyType.warning
          ? successGradient
          : warningGradient
          : errorGradient
          : infoGradient,
    );
  }
}

const successGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xff10b90b), Colors.green],
);

const infoGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.blue, Colors.blueAccent],
);

const warningGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xffc4932a), Color(0xffd09c06)],
);

const errorGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.redAccent, Color(0xffc52525)],
);
