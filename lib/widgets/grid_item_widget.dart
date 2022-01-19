


import 'package:flutter/cupertino.dart';

class GridItemWidget extends StatelessWidget {

  final Color color;

  const GridItemWidget({
    Key? key,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        color: color,
      ),
    );
  }
}