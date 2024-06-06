import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../theme/colors.dart';

var loadingWidgetCircle = LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 20);

void showLoading(){
  Get.dialog(
    AlertDialog(
      backgroundColor: kBgNewColor,
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 50),
            const SizedBox(height: 20),
            const Text("Kutib turing ..."),
          ]
      ),

    ),
    barrierDismissible: false,
  );
}