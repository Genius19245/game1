import 'package:flutter/material.dart';



class AdScreen extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('scan this qr code to subscribe to my youtube channel'),
          Image.asset('assets/images/qr.jpg'),


        ],
      ),
    );
  }
}
