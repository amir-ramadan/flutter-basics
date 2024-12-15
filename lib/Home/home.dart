import 'package:flutter/material.dart';
import 'package:flutter_basics/Screens/magazine_cover.dart';
import 'package:flutter_basics/Screens/title_widget.dart';
import 'package:flutter_basics/model/magazine_model_dm.dart';

TextStyle titleStyle = const TextStyle(color: Colors.white, fontSize: 14);
Color purple = Colors.purple;
Color transparentPurple = Colors.purpleAccent;

class Home extends StatelessWidget {
  static String routeName = 'home';

  List<MagazineModelDm> magazines = [
    MagazineModelDm('assets/head.jpg', 'Your Mind'),
    MagazineModelDm('assets/head.jpg', 'Your Mind'),
    MagazineModelDm('assets/head.jpg', 'Your Mind'),
    MagazineModelDm('assets/head.jpg', 'Your Mind'),
    MagazineModelDm('assets/head.jpg', 'Your Mind'),
    MagazineModelDm('assets/head.jpg', 'Your Mind'),
    MagazineModelDm('assets/head.jpg', 'Your Mind'),
    MagazineModelDm('assets/head.jpg', 'Your Mind'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: purple,
          title: Text(
            'My App',
            style: titleStyle,
          ),
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Back')),
            Row(
              children: [
                TitleWidget('Magazine'),
                TitleWidget('News'),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: magazines.length,
                itemBuilder: (BuildContext context, int index) =>
                    MagazineCover(model: magazines[index]),
              ),
            )
          ],
        ));
  }
}
