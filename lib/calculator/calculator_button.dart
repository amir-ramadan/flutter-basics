import 'package:flutter/material.dart';
import 'package:flutter_basics/calculator/calculator.dart';
class CalculatorButton extends StatelessWidget {
  final String digit;
  final Color backgroundColor;
  final Color textColor;
  final Function onClick;
  const CalculatorButton(
      {super.key, required this.digit,
       this.backgroundColor=Calculator.buttonBackground,
        this.textColor=Calculator.blue,
        required this.onClick
        });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: (){onClick(digit);},
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                backgroundColor: WidgetStatePropertyAll(backgroundColor)),
            child: Text(digit,style: TextStyle(color: textColor,fontSize: 30),)),
      ),
    );
  }
}
