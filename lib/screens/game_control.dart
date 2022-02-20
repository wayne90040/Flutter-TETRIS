import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tertis/controller/game_controller.dart';
import 'package:flutter_tertis/controller/game_controller_roatate.dart';
import 'package:provider/provider.dart';

class GameControl extends StatelessWidget {
  const GameControl({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<GameController>(
      builder: (context, controller, _) =>
        Row(
          children: [
            Expanded(
              child: IconButton(
                  onPressed: () {
                    controller.startGame();
                  },
                  icon: const Icon(Icons.play_circle_fill, size: 50, color: Colors.white)
              ),
            ),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      controller.moveLeft();
                    },
                    icon: const Icon(Icons.arrow_left, size: 50, color: Colors.white)
                )
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    controller.moveRight();
                  },
                  icon: const Icon(Icons.arrow_right, size: 50, color: Colors.white)
              ),
            ),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      controller.rotatePiece();
                    },
                    icon: const Icon(Icons.rotate_right, size: 50, color: Colors.white)
                )
            ),
          ]
        )
    );
  }
}