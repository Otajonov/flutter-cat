import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum RouteStyle {material, cupertino}

bool routePage( Widget page, {BuildContext? context, bool canOnlySwipeFromEdge = false, RouteStyle routeStyle = RouteStyle.material} ) {

  // Navigator.of(Get.context!).push(SwipeablePageRoute(
  //   canOnlySwipeFromEdge: canOnlySwipeFromEdge,
  //   builder: (BuildContext context) => page,
  // ));


  if(routeStyle == RouteStyle.material){
    Navigator.push(
      context ?? Get.context!,
      MaterialPageRoute(builder: (context) => page),
    );
  } else if(routeStyle == RouteStyle.cupertino) {
    Navigator.push(
      context ?? Get.context!,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  return true;
}


bool jumpPage( Widget page, {BuildContext? context, RouteStyle routeStyle = RouteStyle.material} ) {


  if(routeStyle == RouteStyle.material){
    Navigator.pushReplacement( context ?? Get.context!,
      MaterialPageRoute(builder: (context) => page ),
    );
  } else {
    Navigator.pushReplacement( context ?? Get.context!,
      CupertinoPageRoute(builder: (context) => page ),
    );
  }
    
  return true;
}