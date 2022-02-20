

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tertis/constants.dart';
import 'package:flutter_tertis/controller/game_controller.dart';
import 'package:flutter_tertis/controller/game_controller_roatate.dart';
import 'package:flutter_tertis/widgets/grid_widget.dart';
import 'package:provider/provider.dart';

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

                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 50,
                  child: const Text("TERTIS GAME",
                      style: TextStyle(color: Colors.white)),
                ),

                SizedBox(
                  width: itemSize * column + column - 1,  // size + space
                  height: itemSize * row + row - 1,
                  child: Consumer<GameController>(
                      builder: (context, controller, _) {
                        return GridWidget(
                          landedPieces: controller.landedPiecesColor,
                          fallPieces: controller.fallingPiece,
                          fallPiecesColor: controller.fallingPieceColor,
                        );
                      }
                  ),
                ),

                SizedBox(
                  width: itemSize * column + column - 1,
                  child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                gameController.startGame();
                              },
                              icon: const Icon(Icons.play_circle_fill, size: 50, color: Colors.white)
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  gameController.moveLeft();
                                },
                                icon: const Icon(Icons.arrow_left, size: 50, color: Colors.white)
                            )
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                gameController.moveRight();
                              },
                              icon: const Icon(Icons.arrow_right, size: 50, color: Colors.white)
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  gameController.rotatePiece();
                                },
                                icon: const Icon(Icons.rotate_right, size: 50, color: Colors.white)
                            )
                        ),
                      ]
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}