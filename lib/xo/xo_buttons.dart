import 'package:flutter/material.dart';

class XoButtons extends StatelessWidget {
  final String symbol;
  final Function onClick;
  final int index;

  const XoButtons({super.key, required this.symbol, required this.onClick,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        onClick(index);
      },
      child: Text(
        symbol,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40,
            color: symbol == 'x' ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold),
      ),
    ));
  }
}
