

import 'package:flutter/material.dart';
import 'package:flutter_tertis/constants.dart';
import 'package:flutter_tertis/widgets/grid_item_widget.dart';

class GridWidget extends StatelessWidget {

  // 已經落下的方塊
  final List<List<int>> landedPieces;
  // 正在落下的方塊
  final List<int> fallPieces;
  // 正在落下的方塊顏色
  final Color fallPiecesColor;

  const GridWidget({
    Key? key,
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
        for (int i = 0; i < pieceColors.length; i ++ ) {
          if (landedPieces[i].contains(index)) {
            return GridItemWidget(color: pieceColors[i]);
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