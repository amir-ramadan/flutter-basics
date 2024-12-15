import 'package:flutter/material.dart';
import 'package:flutter_basics/xo/game_board.dart';

import 'Home/home.dart';
import 'Login/login.dart';
import 'calculator/calculator.dart';
import 'xo/choose_player_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
    Login.routeName:(context){return Login();
    },
    Home.routeName:(context)=> Home(),
        Calculator.routeName:(context)=> Calculator(),
        GameBoard.routeName:(context)=> GameBoard(),
        ChoosePlayerScreen.routeName:(context)=> ChoosePlayerScreen(),


      },
      initialRoute: ChoosePlayerScreen.routeName,
    );
  }
}
