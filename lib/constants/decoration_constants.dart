import 'package:calculator_app/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../home/screen/calculator_screen.dart';

class DecorationConsatants {
  static DecorationConsatants instance = DecorationConsatants._init();

  DecorationConsatants._init();

  final decorationBox =
      BoxDecoration(color: ColorConstants.instance.whiteColor, borderRadius: BorderRadius.circular(5), boxShadow: [
    BoxShadow(
      color: ColorConstants.instance.whiteColor.withOpacity(01),
      blurRadius: 4,
      spreadRadius: 0.5,
      offset: const Offset(-3, -3),
    )
  ]);
}


BoxDecoration boxDecoration(String text) {
  return BoxDecoration(
      color: getbgColor(text),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.1),
          blurRadius: 4,
          spreadRadius: 0.5,
          offset: const Offset(-3, -3),
        )
      ],
    );
}