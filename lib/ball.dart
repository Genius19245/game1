import 'package:flutter/material.dart';




class MyBall extends StatelessWidget {

  final double ballX;
  final double ballY;
  MyBall({required this.ballX, required this.ballY});


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballX, ballY),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Transform.rotate(
          
            angle: -205,
            child: Image.network('https://cdn-icons-png.flaticon.com/512/5985/5985204.png', width: 100,height: 100)),
      ),

    );
  }
}
