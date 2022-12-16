import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:calculator_app/constants/color_constants.dart';

class TextStyleConstants {
  static TextStyleConstants instance = TextStyleConstants._init();

  TextStyleConstants._init();

  final textStyleConstans =
      TextStyle(fontSize: 32, color: ColorConstants.instance.blueColor, fontWeight: FontWeight.bold);
  // final fontStyleConstans =  TextStyle(fontSize: 32, color: ColorConstants.instance.getColor(), fontWeight: FontWeight.w300);
}

