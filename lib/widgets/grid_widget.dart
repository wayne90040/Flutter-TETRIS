

import 'package:flutter/material.dart';
import 'package:flutter_tertis/widgets/grid_item_widget.dart';

class GridWidget extends StatelessWidget {

  final int totalItem;

  const GridWidget({
    Key? key,
    required this.totalItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GridView.builder(
      itemCount: totalItem,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
      itemBuilder: (BuildContext context, int index) {
        return const GridItemWidget(color: Colors.black);
      }
    );
  }

}