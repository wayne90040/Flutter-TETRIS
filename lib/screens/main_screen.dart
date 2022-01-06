

import 'package:flutter/cupertino.dart';
import 'package:flutter_tertis/widgets/grid_widget.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const GridWidget(totalItem: 150);
  }

}