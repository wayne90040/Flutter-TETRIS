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
                  controller.clean();
                },
                icon: const Icon(Icons.refresh_sharp, color: Colors.white)
              )
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  controller.play();
                },
                icon: Icon(
                    controller.isPlay ? Icons.stop : Icons.play_circle_fill,
                    color: Colors.white)
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  controller.moveLeft();
                },
                icon: const Icon(Icons.arrow_left, color: Colors.white)
              )
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  controller.moveRight();
                },
                icon: const Icon(Icons.arrow_right, color: Colors.white)
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  controller.rotatePiece();
                },
                icon: const Icon(Icons.rotate_right, color: Colors.white)
              )
            ),
          ]
        )
    );
  }
}