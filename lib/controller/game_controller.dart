

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tertis/constants.dart';

class GameController extends ChangeNotifier {

  List<int> fallingPiece = [];
  Color fallingPieceColor = Colors.black;

  int _grade = 0;
  int get grade => _grade;

  final List<int> _landed = [];
  List<int> get landed => _landed;// 場上所有的方塊

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

  late Timer _timer;
  int index = 0;

  void _choosePiece() {
    fallingPiece = List.of(pieceShapes[index % pieceShapes.length]);
    fallingPieceColor = pieceColors[index % pieceColors.length];
  }

  bool _hitFloor() {
    // TODO: 碰到其他方塊也需要停下來
    // beenChosenPiece.sort();
    // 撞到天花板停下
    if (fallingPiece.last + 10 >= totalItem) {
      return true;
    }

    // 撞到其他方塊停下
    for (int i = 0; i < fallingPiece.length; i++) {
      if (_landed.contains(fallingPiece[i] + 10)) {
        return true;
      }
    }
    return false;
  }

  // FIXME: Clear Row BUGS
  void _clearRow() {
    int count;
    List<int> removeItem = [];

    // i 行數
    for (int i = 0; i < row; i ++) {
      removeItem.clear();
      count = 0;
      for (int j = 0; j < column; j++) {
        if (_landed.contains(totalItem - 1 - i * column - j)) {
          removeItem.add(totalItem - i * column - j);
          count ++;
        }
      }
      if (count == 10) {
        _grade += 1;

        for (var element in removeItem) {
          _landed.remove(element);
        }

        // 往下移
        for (int i = 0; i < _landed.length; i++) {
          if (_landed[i] < removeItem.first) {
            _landed[i] += 10;
          }
        }

        // 顏色方塊也需要往下移
        for (int i = 0; i < _landedPiecesColor.length; i++) {
          for (int j = 0; j < _landedPiecesColor[i].length; j++) {
            _landedPiecesColor[i][j] += 10;
          }
        }
      }
    }
  }

  // FIXME: Start Game Revamp
  void startGame() {
    // 選擇落下的方塊
    _choosePiece();
    const duration = Duration(milliseconds: 300);

    Timer.periodic(duration, (timer) {
      _clearRow();
      if (_hitFloor()) {
        for (int i = 0; i < fallingPiece.length; i++) {
          // 全部場上方塊的座標
          _landed.add(fallingPiece[i]);
          // 掉落地板用顏色分類
          _landedPiecesColor[index % pieceShapes.length].add(fallingPiece[i]);
        }
        index ++; // 換下一塊 -> 可以做亂數選擇
        startGame();
        timer.cancel();
      } else {
        moveDown();
      }
    });
  }

  void moveDown() {
    for (int i = 0; i < fallingPiece.length; i ++) {
      fallingPiece[i] += column;
    }
    notifyListeners();
  }

  void moveLeft() {
    HapticFeedback.vibrate();  // 聲音回饋
    // any -> 判斷陣列內是否有滿足條件的元素
    if (!fallingPiece.any(
            (element) => element % column == 0 || _landed.contains(element - 1))
    ) {
      for (int i = 0; i < fallingPiece.length; i++) {
        fallingPiece[i] -= 1;
      }
    }
  }

  void moveRight() {
    HapticFeedback.vibrate();
    if (!fallingPiece.any(
            (element) => (element + 1) % column == 0 || _landed.contains(element + 1))
    ) {
      for (int i = 0; i < fallingPiece.length; i ++) {
        fallingPiece[i] += 1;
      }
    }
  }
}