import 'package:flutter/material.dart';
import 'package:flutter_basics/xo/game_board.dart';
import 'package:flutter_basics/xo/gradient_scaffold.dart';

class ChoosePlayerScreen extends StatelessWidget {
  const ChoosePlayerScreen({super.key});

  static const routeName = 'choose_player_screen';

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        body: Column(
      children: [
        Expanded(
            flex: 7,
            child: Center(
                child: Text(
              "Tic",
              style: TextStyle(fontSize: 52, color: Colors.white),
            ))),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  "Pick How Goes First?",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, GameBoard.routeName,arguments: 'x');
                        },
                        child: Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                              child: Text(
                            'X',
                            style: TextStyle(fontSize: 60, color: Colors.red),
                          )),
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, GameBoard.routeName,arguments: 'o');
                        },
                        child: Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                              child: Text(
                            'O',
                            style: TextStyle(fontSize: 60, color: Colors.green),
                          )),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ))
      ],
    ));
  }
}
