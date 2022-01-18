

import 'package:flutter/material.dart';
import 'package:flutter_tertis/widgets/grid_item_widget.dart';

class GridWidget extends StatelessWidget {

  final List<Color> _pieceColor = [
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.pink
  ];

  final int totalItem;
  final List<List<int>> landedPieces;
  final List<int> fallPieces;
  final Color fallPiecesColor;

  GridWidget({
    Key? key,
    required this.totalItem,
    required this.landedPieces,
    required this.fallPieces,
    required this.fallPiecesColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: totalItem,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1
      ),
      itemBuilder: (BuildContext context, int index) {
        for (int i = 0; i < _pieceColor.length; i ++ ) {
          if (landedPieces[i].contains(index)) {
            return GridItemWidget(color: _pieceColor[i]);
          }
        }
        if (fallPieces.contains(index)) {
          return GridItemWidget(color: fallPiecesColor);
        }
        return const GridItemWidget(color: Colors.black);
      }
    );
  }
}