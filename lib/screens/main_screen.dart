

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tertis/controller/game_controller.dart';
import 'package:flutter_tertis/controller/game_controller_roatate.dart';
import 'package:flutter_tertis/widgets/grid_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var gameController = Provider.of<GameController>(context, listen: false);

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[900],

      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[

              Container(
                padding: const EdgeInsets.only(top: 20),
                height: 50,
                child: const Text("Tertis Game", style: TextStyle(color: Colors.white)),
              ),

              SizedBox(
                width: 25 * 10 + 9,
                height: 25 * 20 + 19,
                child: Consumer<GameController>(
                    builder: (context, controller, _) {
                      return GridWidget(
                        totalItem: controller.totalOfSquares,
                        landedPieces: controller.landedPiecesColor,
                        fallPieces: controller.beenChosenPiece,
                        fallPiecesColor: controller.beenChosenColor,
                      );
                    }
                ),
              ),

              SizedBox(
                width: 25 * 10 + 9,
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
    );
  }
}