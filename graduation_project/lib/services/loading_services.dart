import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading(){

  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 0.0 // Removed radius
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.transparent // Set background to transparent
    ..boxShadow = <BoxShadow>[] // Remove shadow/box
    ..textColor = Colors.white
    ..indicatorColor = const Color(0xFF5D9CEC)
    ..userInteractions = false
    ..dismissOnTap = false;
}
