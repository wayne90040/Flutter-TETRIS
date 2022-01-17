

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameController extends ChangeNotifier {

  // 掉落的方塊形狀
  static List<List<int>> pieces = [
    [4, 5, 14, 15],
    [4, 14, 24, 25],
    [5, 15, 24, 25],
    [4, 14, 24, 34],
    [4, 14, 15, 25],
    [5, 15, 14, 24],
    [4, 5, 6, 15]
  ];

  // 掉落的方塊顏色
  static List<Color> piecesColor = [
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.pink
  ];

  List<int> beenChosenPiece = [];
  Color beenChosenColor = Colors.black;

  int _totalOfSquares = 150;
  int get totalOfSquares => _totalOfSquares;

  final List<int> _landed = [];  // 場上所有的方塊

  final List<List<int>> _landedPiecesColor = [
    [], // red
    [], // yellow
    [], // purple
    [], // green
    [], // blue
    [], // brown
    [], // pink
  ];
  List<List<int>> get landedPiecesColor => _landedPiecesColor;

  int number = 0;

  void setTotalOfSquares(int num) {
    _totalOfSquares = num;
    notifyListeners();
  }

  // 可以隨關卡增加圖案 對應的顏色及轉動的邏輯也要增加
  void _resetPieces() {
    pieces = [
      [4, 5, 14, 15],
      [4, 14, 24, 25],
      [5, 15, 24, 25],
      [4, 14, 24, 34],
      [4, 14, 15, 25],
      [5, 15, 14, 24],
      [4, 5, 6, 15]
    ];
  }

  void _choosePiece() {
    beenChosenPiece = pieces[number % pieces.length];
    beenChosenColor = piecesColor[number % piecesColor.length];
  }

  bool _hitFloor() {
    // TODO: 碰到其他方塊也需要停下來
    // beenChosenPiece.sort();
    // 撞到地板停下
    if (beenChosenPiece.last + 10 >= _totalOfSquares) {
      return true;
    }

    // 撞到其他方塊停下
    for (int i = 0; i < beenChosenPiece.length; i++) {
      if (_landed.contains(beenChosenPiece[i] + 10)) {
        return true;
      }
    }
    return false;
  }

  void _clearRow() {
    // TODO: Clear
    int count;
    List<int> removeItem = [];

    for (int i = 0; i < 15; i ++) {
      removeItem.clear();
      count = 0;

      for (int j = 0; j < 10; j++) {
        if (_landed.contains(totalOfSquares - 1 - i * 10 - j)) {
          removeItem.add(150 - i * 10 - j);
          count ++;
        }
      }

      if (count == 10) {
        for (var element in removeItem) {
          _landed.remove(element);
        }
        // 往下移
        for (int i = 0; i < _landed.length; i++) {
          if (_landed[i] < removeItem.first) {
            _landed[i] += 10;
          }
        }
        for (int i = 0; i < _landedPiecesColor.length; i++) {
          for (int j = 0; j < _landedPiecesColor[i].length; j++) {
            _landedPiecesColor[i][j] += 10;
          }
        }
      }
    }
  }

  // 開始遊戲
  void startGame() {
    _resetPieces();  // 回到第一關
    _choosePiece();  // 選擇落下的方塊

    const duration = Duration(milliseconds: 300);

    Timer.periodic(duration, (timer) {
      _clearRow();
      if (_hitFloor()) {
        for (int i = 0; i < beenChosenPiece.length; i++) {
          // 全部場上方塊的座標
          _landed.add(beenChosenPiece[i]);
          // 掉落地板用顏色分類
          _landedPiecesColor[number % pieces.length].add(beenChosenPiece[i]);
        }
        number ++; // 換下一塊 -> 可以做亂數選擇
        startGame();
        timer.cancel();
      } else {
        moveDown();
      }
    });
  }

  void moveDown() {
    for (int i = 0; i < beenChosenPiece.length; i ++) {
      beenChosenPiece[i] += 10;
    }
    notifyListeners();
  }

  void moveLeft() {
    HapticFeedback.vibrate();  // 聲音回饋
    // any -> 判斷陣列內是否有滿足條件的元素
    if (!beenChosenPiece.any(
            (element) => element % 10 == 0 || _landed.contains(element - 1))
    ) {
      for (int i = 0; i < beenChosenPiece.length; i++) {
        beenChosenPiece[i] -= 1;
      }
    }
  }

  void moveRight() {
    HapticFeedback.vibrate();
    if (!beenChosenPiece.any(
            (element) => (element + 1) % 10 == 0 || _landed.contains(element + 1))
    ) {
      for (int i = 0; i < beenChosenPiece.length; i ++) {
        beenChosenPiece[i] += 1;
      }
    }
  }

  void rotatePiece() {
    beenChosenPiece.sort();
    switch (_identityPiece()) {
      case 0:
        _rotate0to1();
        break;
      case 1:
        _rotate1to0();
        break;
      case 2:
        _rotate2to3();
        break;
      case 3:
        _rotate3to2();
        break;
      case 4:
        _rotate4to5();
        break;
      case 5:
        _rotate5to6();
        break;
      case 6:
        _rotate6to7();
        break;
      case 7:
        _rotate7to4();
        break;
      case 8:
        _rotate8to9();
        break;
      case 9:
        _rotate9to10();
        break;
      case 10:
        _rotate10to11();
        break;
      case 11:
        _rotate11to8();
        break;
      case 12:
        _rotate12to13();
        break;
      case 13:
        _rotate13to14();
        break;
      case 14:
        _rotate14to15();
        break;
      case 15:
        _rotate15to12();
        break;
      case 16:
        _rotate16to17();
        break;
      case 17:
        _rotate17to16();
        break;
    }

    notifyListeners();
  }

  // TODO: Study this logic
  int _identityPiece() {
    int pieceNum = -1;
    beenChosenPiece.sort();
    
    if (beenChosenPiece[0] + 30 == beenChosenPiece[3]) {
      pieceNum = 0;
    } else if (beenChosenPiece[0] + 3 == beenChosenPiece[3]) {
      pieceNum = 1;
    } else if (beenChosenPiece[0] + 10 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 10 + 1 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 20 + 1 == beenChosenPiece[3]) {
      pieceNum = 2;
    } else if (beenChosenPiece[0] + 10 - 1 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 10 == beenChosenPiece[3] &&
        beenChosenPiece[0] + 1 == beenChosenPiece[1]) {
      pieceNum = 3;
    } else if (beenChosenPiece[0] + 10 - 1 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 10 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 10 + 1 == beenChosenPiece[3]) {
      pieceNum = 4;
    } else if (beenChosenPiece[0] + 10 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 10 + 1 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 20 == beenChosenPiece[3]) {
      pieceNum = 5;
    } else if (beenChosenPiece[0] + 1 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 2 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 10 + 1 == beenChosenPiece[3]) {
      pieceNum = 6;
    } else if (beenChosenPiece[0] + 10 - 1 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 10 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 20 == beenChosenPiece[3]) {
      pieceNum = 7;
    } else if (beenChosenPiece[0] + 1 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 10 + 1 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 20 + 1 == beenChosenPiece[3]) {
      pieceNum = 8;
    } else if (beenChosenPiece[0] + 10 - 2 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 10 - 1 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 10 == beenChosenPiece[3]) {
      pieceNum = 9;
    } else if (beenChosenPiece[0] + 10 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 20 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 20 + 1 == beenChosenPiece[3]) {
      pieceNum = 10;
    } else if (beenChosenPiece[0] + 1 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 2 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 10 == beenChosenPiece[3]) {
      pieceNum = 11;
    } else if (beenChosenPiece[0] + 1 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 10 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 20 == beenChosenPiece[3]) {
      pieceNum = 12;
    } else if (beenChosenPiece[0] + 1 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 2 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 10 + 2 == beenChosenPiece[3]) {
      pieceNum = 13;
    } else if (beenChosenPiece[0] + 10 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 20 == beenChosenPiece[3] &&
        beenChosenPiece[0] + 20 - 1 == beenChosenPiece[2]) {
      pieceNum = 14;
    } else if (beenChosenPiece[0] + 10 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 10 + 1 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 10 + 2 == beenChosenPiece[3]) {
      pieceNum = 15;
    } else if (beenChosenPiece[0] + 10 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 10 - 1 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 20 - 1 == beenChosenPiece[3]) {
      pieceNum = 16;
    } else if (beenChosenPiece[0] + 1 == beenChosenPiece[1] &&
        beenChosenPiece[0] + 10 + 1 == beenChosenPiece[2] &&
        beenChosenPiece[0] + 10 + 2 == beenChosenPiece[3]) {
      pieceNum = 17;
    }
    
    return pieceNum;
  }

  /*

  0 ->  x
        x
        x
        x

  1 ->  x x x x

  2 ->  x
        x x
          x

  3 ->    x x
        x x

  4 ->    x
        x x x

  5 ->    x
          x x
          x

  6 ->  x x x
          x

  7 ->    x
        x x
          x

  8 ->  x x
          x
          x

  9 ->      x
        x x x

  10 ->  x
         x
         x x

  11 ->  x x x
         x

  12 ->  x x
         x
         x

  13 -> x x x
            x

  14 ->   x
          x
        x x

  15 -> x
        x x x

  16 ->     x
          x x
          x

  17 ->
          x x
            x x

  */
  void _rotate0to1() {

    if (beenChosenPiece.first % 10 == 9) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 - 2;
      beenChosenPiece[1] = beenChosenPiece[1] - 2;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 + 1 - 2;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 2 - 2;

    } else if (beenChosenPiece.first % 10 == 8) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 - 1;
      beenChosenPiece[1] = beenChosenPiece[1] - 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 + 1 - 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 2 - 1;

    } else if (beenChosenPiece.first % 10 == 0) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 + 1 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 2 + 1;

    } else if (_landed.contains(beenChosenPiece.first + 10 - 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 + 1 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 2 + 1;

    } else if (_landed.contains(beenChosenPiece.first + 10 + 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 - 2;
      beenChosenPiece[1] = beenChosenPiece[1] - 2;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 + 1 - 2;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 2 - 2;

    } else if (_landed.contains(beenChosenPiece.first + 10 + 2)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 - 1;
      beenChosenPiece[1] = beenChosenPiece[1] - 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 + 1 - 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 2 - 1;

    } else {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1;
      beenChosenPiece[1] = beenChosenPiece[1];
      beenChosenPiece[2] = beenChosenPiece[2] - 10 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 2;

    }
  }

  void _rotate1to0() {
    if (beenChosenPiece.first + 10 > 179) {
      beenChosenPiece[0] = beenChosenPiece[0] - 10 + 1 - 20;
      beenChosenPiece[1] = beenChosenPiece[1] - 20;
      beenChosenPiece[2] = beenChosenPiece[2] + 10 - 1 - 20;
      beenChosenPiece[3] = beenChosenPiece[3] + 20 - 2 - 20;

    } else if (beenChosenPiece.first + 20 > 179) {
      beenChosenPiece[0] = beenChosenPiece[0] - 10 + 1 - 10;
      beenChosenPiece[1] = beenChosenPiece[1] - 10;
      beenChosenPiece[2] = beenChosenPiece[2] + 10 - 1 - 10;
      beenChosenPiece[3] = beenChosenPiece[3] + 20 - 2 - 10;

    } else if (_landed.contains(beenChosenPiece.first + 10 + 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] - 10 + 1 - 20;
      beenChosenPiece[1] = beenChosenPiece[1] - 20;
      beenChosenPiece[2] = beenChosenPiece[2] + 10 - 1 - 20;
      beenChosenPiece[3] = beenChosenPiece[3] + 20 - 2 - 20;

    } else if (_landed.contains(beenChosenPiece.first + 20 + 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] - 10 + 1 - 10;
      beenChosenPiece[1] = beenChosenPiece[1] - 10;
      beenChosenPiece[2] = beenChosenPiece[2] + 10 - 1 - 10;
      beenChosenPiece[3] = beenChosenPiece[3] + 20 - 2 - 10;

    } else {
        beenChosenPiece[0] = beenChosenPiece[0] - 10 + 1;
        beenChosenPiece[1] = beenChosenPiece[1];
        beenChosenPiece[2] = beenChosenPiece[2] + 10 - 1;
        beenChosenPiece[3] = beenChosenPiece[3] + 20 - 2;
    }
  }

  void _rotate2to3() {
    if (beenChosenPiece.first % 10 == 0) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 - 1 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 1;

    } else if (_landed.contains(beenChosenPiece.first + 10 - 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 - 1 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 1;

    } else {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1;
      beenChosenPiece[1] = beenChosenPiece[1];
      beenChosenPiece[2] = beenChosenPiece[2] - 10 - 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20;
    }
  }

  void _rotate3to2() {
    beenChosenPiece[0] = beenChosenPiece[0];
    beenChosenPiece[1] = beenChosenPiece[1] + 20;
    beenChosenPiece[2] = beenChosenPiece[2] + 2;
    beenChosenPiece[3] = beenChosenPiece[3];
  }

  void _rotate4to5() {
    beenChosenPiece[0] = beenChosenPiece[0];
    beenChosenPiece[1] = beenChosenPiece[1] + 10 + 1;
    beenChosenPiece[2] = beenChosenPiece[2];
    beenChosenPiece[3] = beenChosenPiece[3];
  }

  void _rotate5to6() {
    if (beenChosenPiece.first % 10 == 0) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] + 1;
      beenChosenPiece[3] = beenChosenPiece[3] + 1;

    } else if (_landed.contains(beenChosenPiece.first + 10 - 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] + 1;
      beenChosenPiece[3] = beenChosenPiece[3] + 1;

    } else {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1;
      beenChosenPiece[1] = beenChosenPiece[1];
      beenChosenPiece[2] = beenChosenPiece[2];
      beenChosenPiece[3] = beenChosenPiece[3];
    }
  }

  void _rotate6to7() {
      beenChosenPiece[0] = beenChosenPiece[0];
      beenChosenPiece[1] = beenChosenPiece[1];
      beenChosenPiece[2] = beenChosenPiece[2] - 10 - 1;
      beenChosenPiece[3] = beenChosenPiece[3];
  }

  void _rotate7to4() {
    if (beenChosenPiece.first % 10 == 9) {

      beenChosenPiece[0] = beenChosenPiece[0] - 1;
      beenChosenPiece[1] = beenChosenPiece[1] - 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 10 + 1 - 1;

    } else if (_landed.contains(beenChosenPiece.first + 10 + 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] - 1;
      beenChosenPiece[1] = beenChosenPiece[1] - 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 10 + 1 - 1;

    } else {
      beenChosenPiece[0] = beenChosenPiece[0];
      beenChosenPiece[1] = beenChosenPiece[1];
      beenChosenPiece[2] = beenChosenPiece[2];
      beenChosenPiece[3] = beenChosenPiece[3] - 10 + 1;
    }
  }

  void _rotate8to9() {
    beenChosenPiece[0] = beenChosenPiece[0] + 2;
    beenChosenPiece[1] = beenChosenPiece[1] + 10 + 1;
    beenChosenPiece[2] = beenChosenPiece[2];
    beenChosenPiece[3] = beenChosenPiece[3] - 10 - 1;
  }

  void _rotate9to10() {
    beenChosenPiece[0] = beenChosenPiece[0] - 10 - 1 - 1;
    beenChosenPiece[1] = beenChosenPiece[1] - 10 + 1 - 1;
    beenChosenPiece[2] = beenChosenPiece[2] - 1;
    beenChosenPiece[3] = beenChosenPiece[3] - 1;
  }

  void _rotate10to11() {
    if (beenChosenPiece.last % 10 == 9) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 + 2 - 1;
      beenChosenPiece[1] = beenChosenPiece[1] - 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 10 - 1;

    } else if (_landed.contains(beenChosenPiece.first + 10 + 2)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 + 2 - 1;
      beenChosenPiece[1] = beenChosenPiece[1] - 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 10 - 1;

    } else {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 + 2;
      beenChosenPiece[1] = beenChosenPiece[1];
      beenChosenPiece[2] = beenChosenPiece[2];
      beenChosenPiece[3] = beenChosenPiece[3] - 10;

    }
  }

  void _rotate11to8() {
    beenChosenPiece[0] = beenChosenPiece[0] - 10;
    beenChosenPiece[1] = beenChosenPiece[1];
    beenChosenPiece[2] = beenChosenPiece[2] - 10 - 1;
    beenChosenPiece[3] = beenChosenPiece[3] + 1;
  }

  void _rotate12to13() {
    beenChosenPiece[0] = beenChosenPiece[0];
    beenChosenPiece[1] = beenChosenPiece[1];
    beenChosenPiece[2] = beenChosenPiece[2] - 10 - 1;
    beenChosenPiece[3] = beenChosenPiece[3] - 10 + 1;
  }

  void _rotate13to14() {
    beenChosenPiece[0] = beenChosenPiece[0] - 10 + 2;
    beenChosenPiece[1] = beenChosenPiece[1] + 10;
    beenChosenPiece[2] = beenChosenPiece[2];
    beenChosenPiece[3] = beenChosenPiece[3];
  }

  void _rotate14to15() {
    if (beenChosenPiece.last % 10 == 9) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 - 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 10 + 1 - 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 1;
    } else {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 10 + 1;
      beenChosenPiece[2] = beenChosenPiece[2];
      beenChosenPiece[3] = beenChosenPiece[3];
    }
  }

  void _rotate15to12() {
    beenChosenPiece[0] = beenChosenPiece[0];
    beenChosenPiece[1] = beenChosenPiece[1];
    beenChosenPiece[2] = beenChosenPiece[2] - 20;
    beenChosenPiece[3] = beenChosenPiece[3] - 20 - 2;
  }

  void _rotate16to17() {

    if (beenChosenPiece.first % 10 == 1) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 2 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] + 10 - 1 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] + 1 + 1;

    } else if (_landed.contains(beenChosenPiece.first + 10 - 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 - 1 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 1;

    } else if (_landed.contains(beenChosenPiece.first + 10 - 2)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 2 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] + 10 - 1 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] + 1 + 1;

    } else {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 2;
      beenChosenPiece[1] = beenChosenPiece[1];
      beenChosenPiece[2] = beenChosenPiece[2] + 10 - 1;
      beenChosenPiece[3] = beenChosenPiece[3] + 1;
    }
  }

  void _rotate17to16() {
    beenChosenPiece[0] = beenChosenPiece[0] + 1;
    beenChosenPiece[1] = beenChosenPiece[1] + 1;
    beenChosenPiece[2] = beenChosenPiece[2] - 1 + 1;
    beenChosenPiece[3] = beenChosenPiece[3] - 1 - 20 + 1;
  }
}