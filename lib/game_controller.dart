

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  // 可以隨關卡增加圖案
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
  }

  // 開始遊戲
  void startGame() {
    _resetPieces();  // 回到第一關
    _choosePiece();  // 選擇落下的方塊
    const duration = Duration(milliseconds: 300);
    Timer.periodic(duration, (timer) {
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

  void moveRight() {

  }

  void moveLeft() {

  }

}