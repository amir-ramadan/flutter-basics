import 'package:flutter/material.dart';
import 'package:flutter_basics/calculator/calculator_button.dart';

class Calculator extends StatefulWidget {
  static const Color blue = Color(0xff29A8ff);
  static const Color buttonBackground = Color(0xff303136);
  static const Color scaffold = Color(0xff17181A);
  static const Color lightBlue = Color(0xff1991FF);
  static const Color grey = Color(0xffA5A5A5);
  static String routeName = "calculator";

  Calculator({super.key});

  @override
  State<Calculator> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  int counter = 0;
  String result = '';
  String lhS = '';
  String savedOperator = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Calculator.scaffold,
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      result,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalculatorButton(
                      digit: '7',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '8',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '9',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '-',
                      onClick: onOperatorClick,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalculatorButton(
                      digit: '4',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '5',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '6',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '+',
                      onClick: onOperatorClick,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalculatorButton(
                      digit: '1',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '2',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '3',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '/',
                      onClick: onOperatorClick,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalculatorButton(
                      digit: '.',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '0',
                      onClick: onDigitClick,
                    ),
                    CalculatorButton(
                      digit: '=',
                      onClick: onEqualClick,
                    ),
                    CalculatorButton(
                      digit: '*',
                      onClick: onOperatorClick,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void onDigitClick(String digit) {
    if(digit=='.'&&result.contains('.'))return;
    result += digit;
    setState(() {});
  }

  void onOperatorClick(String clickedOperator) {
    if (savedOperator.isEmpty) {
      lhS = result;
    } else {
      if(result =='')return;
      lhS = calculate(lhS, savedOperator, result);
    }
    savedOperator = clickedOperator;
    result = '';
    setState(() {});
  }

  void onEqualClick(String _) {
    if(result =='')return;
    result = calculate(lhS, savedOperator, result);
    lhS = '';
    savedOperator = '';
    setState(() {});
  }

  String calculate(String lhS, String operator, String rhS) {
    double n1 = double.parse(lhS);
    double n2 = double.parse(rhS);
    if (operator == '+') {
      return '${n1 + n2}';
    } else if (operator == '-') {
      return '${n1 - n2}';
    } else if (operator == '/') {
      return '${n1 / n2}';
    } else {
      return '${n1 * n2}';
    }
  }
}
