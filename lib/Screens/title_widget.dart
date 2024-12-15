import 'package:flutter/material.dart';

import '../Home/home.dart';

class TitleWidget extends StatelessWidget{
  String title;
  TitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          padding: EdgeInsets.all(8),
          color: purple,
          child: Text(
            title,
            style: titleStyle,
            textAlign: TextAlign.center,
          )),
    );
  }
}
