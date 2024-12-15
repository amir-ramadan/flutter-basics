import 'package:flutter/material.dart';
import 'package:flutter_basics/model/magazine_model_dm.dart';

import '../Home/home.dart';

class MagazineCover extends StatelessWidget {
MagazineModelDm model;
  MagazineCover({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return              Expanded(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Image.asset(model.image),
          Container(
              margin: EdgeInsets.all(8),
              padding:
              EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              color: transparentPurple,
              child: Text(
                model.title,
                style: titleStyle,
              )),
        ],
      ),
    );
  }
}
