


import 'package:flutter/cupertino.dart';

class GridItemWidget extends StatelessWidget {

  final Color color;

  const GridItemWidget({
    Key? key,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ClipRect(
        child: Container(
          color: color,
        ),
      ),
    );
  }
}