import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
final playerX;

MyPlayer({required this.playerX});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(playerX, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 70,
          height: 70,
          child: Image.network('https://cdn-icons-png.flaticon.com/512/6541/6541764.png'),
        ),
      ),
    );
  }
}
