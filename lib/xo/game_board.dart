import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basics/xo/gradient_scaffold.dart';
import 'package:flutter_basics/xo/xo_buttons.dart';

Color lightBlue = Color(0xff00D2FF);
Color darkLightBlue = Color(0xff3A7BD5);

class GameBoard extends StatefulWidget {
  static const routeName = 'game_board';

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late Timer timer;
  String firstPlayer ='';
  String secondPlayer ='';

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  Widget build(BuildContext context) {
    ModalRoute currentScreenModelRoute = ModalRoute.of(context)!;
    firstPlayer=currentScreenModelRoute.settings.arguments as String;
    secondPlayer = firstPlayer =='x'?'o':'x';

    return GradientScaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Back')),
          buildStopWatch(),
          buildPlayerTurnText(),
          buildBord(),
          buildRestButton(),
        ],
      ),
    );
  }

  List<String> boardState = ['', '', '', '', '', '', '', '', ''];
  bool isWinner = false;
  int drawCounter = 0;

  void startTimer(){
   timer = Timer.periodic(Duration(seconds: 1), (_){
     setState(() {

     });
   }

   );
  }

  void onUserClick(int buttonIndex) {
    if (boardState[buttonIndex].isNotEmpty) return;
    if (isWinner) return;
    boardState[buttonIndex] = drawCounter % 2 == 0 ? firstPlayer : secondPlayer;
    if (checkWinner()) {
      isWinner = true;
      timer.cancel();
      setState(() {});
      return;
    }
    setState(() {});
    drawCounter++;
  }

  bool checkWinner() {
    String playerTurn = drawCounter % 2 == 0 ? firstPlayer : secondPlayer;
    if (boardState[0] == playerTurn &&
        boardState[1] == playerTurn &&
        boardState[2] == playerTurn) return true;

    if (boardState[3] == playerTurn &&
        boardState[4] == playerTurn &&
        boardState[5] == playerTurn) return true;

    if (boardState[6] == playerTurn &&
        boardState[7] == playerTurn &&
        boardState[8] == playerTurn) return true;

    if (boardState[0] == playerTurn &&
        boardState[3] == playerTurn &&
        boardState[6] == playerTurn) return true;

    if (boardState[1] == playerTurn &&
        boardState[4] == playerTurn &&
        boardState[7] == playerTurn) return true;

    if (boardState[2] == playerTurn &&
        boardState[5] == playerTurn &&
        boardState[8] == playerTurn) return true;

    if (boardState[0] == playerTurn &&
        boardState[4] == playerTurn &&
        boardState[8] == playerTurn) return true;

    if (boardState[2] == playerTurn &&
        boardState[4] == playerTurn &&
        boardState[6] == playerTurn) return true;
    return false;
  }

  Container buildUserButtons() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(44)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                XoButtons(
                  symbol: boardState[0],
                  onClick: onUserClick,
                  index: 0,
                ),
                XoButtons(
                  symbol: boardState[1],
                  onClick: onUserClick,
                  index: 1,
                ),
                XoButtons(
                  symbol: boardState[2],
                  onClick: onUserClick,
                  index: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                XoButtons(
                  symbol: boardState[3],
                  onClick: onUserClick,
                  index: 3,
                ),
                XoButtons(
                  symbol: boardState[4],
                  onClick: onUserClick,
                  index: 4,
                ),
                XoButtons(
                  symbol: boardState[5],
                  onClick: onUserClick,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                XoButtons(
                  symbol: boardState[6],
                  onClick: onUserClick,
                  index: 6,
                ),
                XoButtons(
                  symbol: boardState[7],
                  onClick: onUserClick,
                  index: 7,
                ),
                XoButtons(
                  symbol: boardState[8],
                  onClick: onUserClick,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStopWatch() {

    int seconds = timer.tick;
    int hours = seconds ~/3600;
    seconds -=hours *3600;
    int minutes = seconds~/60;
    seconds -= minutes*60;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 18),
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44),
      ),
      child: Text(
        '${hours <10?"0$hours":hours}:${minutes <10?"0$minutes":minutes}:${seconds <10?"0$seconds":seconds}',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black),
      ),
    );
  }

  Widget buildPlayerTurnText() {
    return Text(
      drawCounter == 9
          ? "Draw"
          : "Player ${drawCounter % 2 == 0 ? "1" : "2"}'s ${isWinner?"Wins":"Turn"}",
      style: TextStyle(
          fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget buildBord() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Stack(
        children: [
          buildUserButtons(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalDivider(
                thickness: 1,
                color: Colors.black,
              ),
              VerticalDivider(
                thickness: 1,
                color: Colors.black,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget buildRestButton() {
    return ElevatedButton(
        onPressed: () {
          boardState = ['', '', '', '', '', '', '', '', ''];
          isWinner =  false;
          drawCounter = 0;
          startTimer();
          setState(() {});
        },
        child: Text('Rest'));
  }
}
