import 'package:flutter/material.dart';



class MyMissile extends StatelessWidget {

  final missileX;
  final  missileHeight;

  MyMissile({required this.missileHeight, required this.missileX});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(missileX, 1),
      child: Container(
        width: 2,
        height: missileHeight,
        color: Colors.grey,
      ),
    );
  }
}
