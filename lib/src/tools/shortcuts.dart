import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool routePage( Widget page, {bool canOnlySwipeFromEdge = false} ) {

  // Navigator.of(Get.context!).push(SwipeablePageRoute(
  //   canOnlySwipeFromEdge: canOnlySwipeFromEdge,
  //   builder: (BuildContext context) => page,
  // ));

  return true;
}

bool jumpPage( Widget page ) {

    Navigator.pushReplacement( Get.context!,
      MaterialPageRoute(builder: (context) => page ),
    );
    
  return true;
}