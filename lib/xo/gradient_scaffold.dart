import 'package:flutter/material.dart';

import 'game_board.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;

  const GradientScaffold({super.key,required this.body});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [lightBlue,darkLightBlue])
          ),
          child:body,
        ),
      ),
    );

  }
}
