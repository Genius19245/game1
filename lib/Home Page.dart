
import 'dart:async';
import 'dart:math';

import 'package:buuble/ad.dart';
import 'package:buuble/ball.dart';
import 'package:buuble/missle.dart';
import 'package:buuble/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'button.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


enum direction{LEFT, RIGHT, UP}

class _HomePageState extends State<HomePage> {

  static double playerX = 0;
  double missileX = playerX;
  double missileHeight = 10;
  bool midshot = false;
  double ballX = 0.5;
  double ballY = 1;
  var ballDirection = direction.LEFT;
  double velocity = 75;
  var rannum = Random().nextInt(1);


  void startGame(){
    double time = 0;
    double height = 0;

       Timer.periodic(Duration(milliseconds: 50), (timer) {
         height = -5 * time * time + velocity * time;


         if(height < 0 ){
           time = 0;
         }


         if(playerDies()){
           // if(rannum == 0){
           //   MaterialPageRoute(builder: (context) =>  AdScreen());
           //
           // } else if(rannum == 1){
           //   showDialog(context: context, builder: (BuildContext context){
           //     time = 0;
           //     velocity = 0;
           //     return AlertDialog(
           //       title: Center(child: Text('you lose', style: TextStyle(fontSize: 50),
           //       ),
           //       ),
           //     );
           //
           //     });
           //   if(height < 0 ){
           //     time = 0;
           //   }
           // }





         showDialog(context: context, builder: (BuildContext context){
             time = 0;
             velocity = 0;
             return AlertDialog(
               title: Center(child: Text('you lose', style: TextStyle(fontSize: 50),
               ),
               ),
             );

             });
           if(height < 0 ){
             time = 0;
           }

           }


         setState(() {
           ballY = HeightToPosition(height);

         });

         // if(ballX == playerX && ballY == 1){
         //   time += 0.1;
         // }

        if(ballX - 0.005< -1 ){
          ballDirection = direction.RIGHT;
        }else if(ballX + 0.005> 1 ){
          ballDirection = direction.LEFT;
        }
        if(ballDirection == direction.LEFT){
          setState(() {
            ballX -= 0.01;
          });
        } else if(ballDirection == direction.RIGHT){
          setState(() {
            ballX += 0.01;
          });
        }



         time += 0.1;
        velocity += 0.1;
       });

  }


  void moveLeft(){
    setState(() {
     if(playerX - 0.1 < -1){

     }else{
       playerX -= 0.1;
     }
     // if(!midshot){
     //   missileX = playerX;
     //
     // }

    });
  }
  
  // void resetMissile(){
  //   missileX = playerX;
  //   missileHeight = 10;
  // }
  bool playerDies(){
    if((ballX - playerX).abs() < 0.05 && ballY > 0.95){
     return true;
    } else {
      return false;
    }
  }

  void moveRight(){
    setState(() {
      if(playerX + 0.1 > 1){

      }else{
        playerX += 0.1;
      }
      if(!midshot){
        missileX = playerX;

      }

    });

  }
//fire missile
  // void fireMissile(){
  //  if(midshot == false){
  //    Timer.periodic(const Duration(milliseconds: 20), (timer) {
  //
  //
  //      midshot = true;
  //
  //      setState(() {
  //        missileHeight += 10;
  //      });
  //
  //      if(missileHeight > MediaQuery.of(context).size.height * 3/4){
  //        resetMissile();
  //        timer.cancel();
  //        midshot = false;
  //      }
  //      if(ballY > HeightToPosition(missileHeight) &&
  //          (ballX - missileX).abs() < 0.05){
  //        resetMissile();
  //        ballY = 5;
  //        timer.cancel();
  //      }
  //    });
  //  }
  //
  // }// fire missile

  double HeightToPosition(double height){
    double totalHeight = MediaQuery.of(context).size.height *3/4;
    double position = 1 - 2 * height/totalHeight;
    return position;
  }

   ads(){
    if(playerDies()){

    }
  }

  
  

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft)){
          moveLeft();
        } else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight)){
        moveRight();
        }
    // if(event.isKeyPressed(LogicalKeyboardKey.space)){
        //   fireMissile();
        // }
      },
      child: Stack(

        children: [
          Expanded(child: Image.asset("assets/images/back.jpg", fit: BoxFit.fill, height: double.infinity,),
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: Stack(
                      children: [
                        MyBall(ballX: ballX, ballY: ballY),
                        MyBall(ballX: ballX, ballY: ballY),

                        MyMissile(
                          missileHeight: missileHeight,
                          missileX: missileX,
                        ),

                        MyPlayer(
                          playerX: playerX,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      MyButton(
                        icon: Icons.arrow_back ,
                        function: moveLeft,
                      ),
                      // MyButton(
                      //   icon: Icons.arrow_upward,
                      //   function: fireMissile,
                      // ),
                      MyButton(
                        icon: Icons.arrow_forward,
                        function: moveRight,
                      ),
                      MyButton(
                        icon: Icons.play_arrow,
                        function: startGame,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        // Image.asset("assets/images/back.jpg")
         // Image.network('https://img.freepik.com/free-vector/nuclear-bomb-explosion-desert-nuke-mushroom-fire-cloud-rising-sky-arizona-canyon-landscape-with-highway-cacti-rocks-atom-war-apocalypse-game-scene-cartoon-vector-illustration_107791-9389.jpg?w=1800&t=st=1661897949~exp=1661898549~hmac=8c7b2d593c73bc4b430ec97445f7ef3cd70fd7fc83c5159ceeb3369851462fa2'),

        ],
      ),
    );
  }
}

