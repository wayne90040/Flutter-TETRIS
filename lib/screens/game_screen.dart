

import 'package:flutter/cupertino.dart';
import 'package:flutter_tertis/controller/game_controller.dart';
import 'package:flutter_tertis/widgets/grid_widget.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<GameController>(
      builder: (context, controller, _) =>
        GridWidget(
            landedPieces: controller.landedPiecesColor,
            fallPieces: controller.fallingPiece,
            fallPiecesColor: controller.fallingPieceColor
        )
    );
  }
}