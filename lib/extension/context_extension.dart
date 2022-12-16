
import 'package:flutter/material.dart';

import '../constants/button_list.dart';
import '../home/screen/calculator_screen.dart';

extension ContextExtension on BuildContext {
  double  dynamicHeight (double value) => MediaQuery.of(this).size.height * value;

}





  