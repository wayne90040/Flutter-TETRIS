

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tertis/constants.dart';
import 'package:soundpool/soundpool.dart';


enum Sound {
  clean, drop, explosion, move, rotate, start
}

extension SoundExtension on Sound {

  String fileName() {
    switch (this) {
      case Sound.clean:
        return 'clean.mp3';

      case Sound.drop:
        return 'drop.mp3';

      case Sound.explosion:
        return 'explosion.mp3';

      case Sound.move:
        return 'move.mp3';

      case Sound.rotate:
        return 'rotate.mp3';

      case Sound.start:
        return 'start.mp3';
    }
  }
}

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

  final Soundpool _pool = Soundpool(streamType: StreamType.music, maxStreams: 4);
  final Map<String, int> _soundIds = {};

  bool _isPlay = false;
  bool get isPlay => _isPlay;

  Timer? _timer;
  int index = 0;

  GameController() {
    Sound.values.forEach((sound) {
      scheduleMicrotask(() async {
        final data = await rootBundle.load('assets/sounds/${sound.fileName()}');
        _soundIds[sound.fileName()] = await _pool.load(data);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pool.dispose();
    _stop();
  }

  void _playSound(Sound sound) {
    final soundId = _soundIds[sound.fileName()];
    if (soundId != null) _pool.play(soundId);
  }

  void _choosePiece() {
    fallingPiece = List.of(PIECESHAPES[index % PIECESHAPES.length]);
    fallingPieceColor = PIECECOLORS[index % PIECECOLORS.length];
  }

  bool _hitFloor() {
    if (fallingPiece.last + 10 >= TOTALITEM) {
      return true;
    }

    for (int i = 0; i < fallingPiece.length; i++) {
      if (_landed.contains(fallingPiece[i] + 10)) {
        return true;
      }
    }
    return false;
  }

  void _clearRow() {
    int count;
    List<int> removeItem = [];

    for (int i = 0; i < ROW; i ++) {

      removeItem.clear();
      count = 0;

      for (int j = 0; j < COLUMN; j++) {
        // print("j: ${j}");
        // print("landed: $_landed");
        if (_landed.contains(TOTALITEM - 1 - i * COLUMN - j)) {
          removeItem.add(TOTALITEM - 1 - i * COLUMN - j);
          count ++;
        }
      }

      if (count == 10) {

        for (var element in removeItem) {
          _landedPiecesColor.forEach((colorPieces) {
            colorPieces.remove(element);
          });
          _landed.remove(element);
        }

        for (int i = 0; i < _landed.length; i++) {
          if (_landed[i] < removeItem.first) {
            _landed[i] += 10;
          }
        }

        for (int i = 0; i < _landedPiecesColor.length; i++) {
          for (int j = 0; j < _landedPiecesColor[i].length; j++) {
            if (_landedPiecesColor[i][j] < removeItem.first) {
              _landedPiecesColor[i][j] += 10;
            }
          }
        }
        _playSound(Sound.explosion);
        _grade += 1;
        notifyListeners();
      }
    }
  }

  void _start() {

    _choosePiece();

    const duration = Duration(milliseconds: 300);

    _stop();

    Timer.periodic(duration, (timer) {
      // _clearRowRe();
      _clearRow();
      if (_hitFloor()) {
        for (int i = 0; i < fallingPiece.length; i++) {
          // 全部場上方塊的座標
          _landed.add(fallingPiece[i]);
          // 掉落地板用顏色分類
          _landedPiecesColor[index % PIECESHAPES.length].add(fallingPiece[i]);
        }
        index ++;
        _choosePiece();
        print("timecancel");
        // timer.cancel();
      } else {
        moveDown();
      }
    });
  }

  void _stop() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }

  void play() {
    if (_isPlay) {
      _isPlay = false;
      _stop();
    } else {
      _isPlay = true;
      _start();
    }
    notifyListeners();
  }

  void moveDown() {
    for (int i = 0; i < fallingPiece.length; i ++) {
      fallingPiece[i] += COLUMN;
    }
    _playSound(Sound.drop);
    notifyListeners();
  }

  void moveLeft() {
    _playSound(Sound.move);

    // any -> 判斷陣列內是否有滿足條件的元素
    if (!fallingPiece.any(
            (element) => element % COLUMN == 0 || _landed.contains(element - 1))
    ) {
      for (int i = 0; i < fallingPiece.length; i++) {
        fallingPiece[i] -= 1;
      }
    }
  }

  void moveRight() {
    _playSound(Sound.move);
    if (!fallingPiece.any(
            (element) => (element + 1) % COLUMN == 0 || _landed.contains(element + 1))
    ) {
      for (int i = 0; i < fallingPiece.length; i ++) {
        fallingPiece[i] += 1;
      }
    }
  }

  void clean() {
    _grade = 0;
    _landed.clear();
    _landedPiecesColor.forEach((element) {
      element.clear();
    });
  }
}