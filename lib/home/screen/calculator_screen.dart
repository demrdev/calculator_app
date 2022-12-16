import 'dart:html';

import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/constants/decoration_constants.dart';
import 'package:calculator_app/constants/text_style_constants.dart';
import 'package:calculator_app/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../constants/button_list.dart';
import '../../constants/padding_constant.dart';

part 'home_strings_values.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInput = "";
  String result = "0";

  final ButtonList buttonList = ButtonList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.instance.greenColor,
      body: Column(
        children: [
          SizedBox(
            height: context.dynamicHeight(0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: PaddingConstants.instance.paddingAllNormal,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "",
                    style: textStyle(),
                  ),
                ),
                Container(
                  padding: PaddingConstants.instance.paddingAllNormal2,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "0",
                    style: TextStyleConstants.instance.textStyleConstans,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: ColorConstants.instance.whiteColor.withOpacity(0.5),
          ),
          Expanded(
              child: Container(
            padding: PaddingConstants.instance.paddingAllNormal2,
            child: newGridView(),
          ))
        ],
      ),
    );
  }

  GridView newGridView() {
    return GridView.builder(
        itemCount: ButtonList().buttonList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemBuilder: (BuildContext context, int index) {
          return CustomButton(ButtonList().buttonList[index]);
        });
  }

  Widget CustomButton(String text) {
    return InkWell(
      splashColor: ColorConstants.instance.blueColor,
      onTap: () {
        handleButton(text);
      },
      child: Ink(
        decoration: boxDecoration(text),
        child: Center(
          child: Text(text, style: newTextStyle(text)),
        ),
      ),
    );
  }

  handleButton(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    }

    if (text == "C") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
        return;
      } else {
        return null;
      }

      if (text == "=") {
        result = calculate();
        userInput = result;
        if (userInput.endsWith(".0")) {
          userInput = userInput.replaceAll(".0", "");
        }

        if (result.endsWith(".0")) {
          result = result.replaceAll(".0", "");
          return;
        }
      }
    }
    userInput = userInput + text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "error";
    }
  }
}

getColor(String text) {
  if (text == "/" || text == "*" || text == "+" || text == "-" || text == "c" || text == "(" || text == ")") {
    return ColorConstants.instance.redColor;
  }
}

getbgColor(String text) {
  if (text == "AC") {
    return ColorConstants.instance.redColor;
  }

  if (text == "=") {
    return ColorConstants.instance.newColor;
  }
}
