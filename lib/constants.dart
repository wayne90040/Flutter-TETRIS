


import 'dart:ui';

import 'package:flutter/material.dart';

const int TOTALITEM = 200;
const int ROW = 20;
const int COLUMN = 10;
const int ITEMSIZE = 20;

// 掉落方塊的顏色
const List<Color> PIECECOLORS = [
  Colors.red,
  Colors.yellow,
  Colors.purple,
  Colors.green,
  Colors.blue,
  Colors.brown,
  Colors.pink
];

// 掉落方塊的形狀
const List<List<int>> PIECESHAPES = [
  [4, 5, 14, 15],
  [4, 14, 24, 25],
  [5, 15, 24, 25],
  [4, 14, 24, 34],
  [4, 14, 15, 25],
  [5, 15, 14, 24],
  [4, 5, 6, 15]
];