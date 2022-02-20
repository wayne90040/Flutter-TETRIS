

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tertis/constants.dart';
import 'package:flutter_tertis/controller/game_controller.dart';
import 'package:flutter_tertis/controller/game_controller_roatate.dart';
import 'package:provider/provider.dart';

import 'game_control.dart';
import 'game_screen.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    GameController gameController = Provider.of<GameController>(context, listen: false);

    return KeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKeyEvent: (event) {
        if (event is KeyDownEvent || event is KeyRepeatEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            gameController.moveRight();
          }
          else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            gameController.moveLeft();
          }
          else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            gameController.rotatePiece();
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[

                header(),

                const SizedBox(
                  width: ITEMSIZE * COLUMN + COLUMN - 1,
                  height: ITEMSIZE * ROW + ROW - 1,
                  child: GameScreen()
                ),

               const SizedBox(
                  width: ITEMSIZE * COLUMN + COLUMN - 1,
                  child: GameControl()
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  Container header() =>
      Container(
        padding: const EdgeInsets.only(top: 20),
        height: 50,
        child: const Text("TERTIS GAME",
            style: TextStyle(color: Colors.white))
      );
}



