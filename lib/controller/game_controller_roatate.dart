


import 'game_controller.dart';

extension Roatate on GameController {

  int _identityPiece() {
    int pieceNum = -1;
    fallingPiece.sort();

    if (fallingPiece[0] + 30 == fallingPiece[3]) {
      pieceNum = 0;
    } else if (fallingPiece[0] + 3 == fallingPiece[3]) {
      pieceNum = 1;
    } else if (fallingPiece[0] + 10 == fallingPiece[1] &&
        fallingPiece[0] + 10 + 1 == fallingPiece[2] &&
        fallingPiece[0] + 20 + 1 == fallingPiece[3]) {
      pieceNum = 2;
    } else if (fallingPiece[0] + 10 - 1 == fallingPiece[2] &&
        fallingPiece[0] + 10 == fallingPiece[3] &&
        fallingPiece[0] + 1 == fallingPiece[1]) {
      pieceNum = 3;
    } else if (fallingPiece[0] + 10 - 1 == fallingPiece[1] &&
        fallingPiece[0] + 10 == fallingPiece[2] &&
        fallingPiece[0] + 10 + 1 == fallingPiece[3]) {
      pieceNum = 4;
    } else if (fallingPiece[0] + 10 == fallingPiece[1] &&
        fallingPiece[0] + 10 + 1 == fallingPiece[2] &&
        fallingPiece[0] + 20 == fallingPiece[3]) {
      pieceNum = 5;
    } else if (fallingPiece[0] + 1 == fallingPiece[1] &&
        fallingPiece[0] + 2 == fallingPiece[2] &&
        fallingPiece[0] + 10 + 1 == fallingPiece[3]) {
      pieceNum = 6;
    } else if (fallingPiece[0] + 10 - 1 == fallingPiece[1] &&
        fallingPiece[0] + 10 == fallingPiece[2] &&
        fallingPiece[0] + 20 == fallingPiece[3]) {
      pieceNum = 7;
    } else if (fallingPiece[0] + 1 == fallingPiece[1] &&
        fallingPiece[0] + 10 + 1 == fallingPiece[2] &&
        fallingPiece[0] + 20 + 1 == fallingPiece[3]) {
      pieceNum = 8;
    } else if (fallingPiece[0] + 10 - 2 == fallingPiece[1] &&
        fallingPiece[0] + 10 - 1 == fallingPiece[2] &&
        fallingPiece[0] + 10 == fallingPiece[3]) {
      pieceNum = 9;
    } else if (fallingPiece[0] + 10 == fallingPiece[1] &&
        fallingPiece[0] + 20 == fallingPiece[2] &&
        fallingPiece[0] + 20 + 1 == fallingPiece[3]) {
      pieceNum = 10;
    } else if (fallingPiece[0] + 1 == fallingPiece[1] &&
        fallingPiece[0] + 2 == fallingPiece[2] &&
        fallingPiece[0] + 10 == fallingPiece[3]) {
      pieceNum = 11;
    } else if (fallingPiece[0] + 1 == fallingPiece[1] &&
        fallingPiece[0] + 10 == fallingPiece[2] &&
        fallingPiece[0] + 20 == fallingPiece[3]) {
      pieceNum = 12;
    } else if (fallingPiece[0] + 1 == fallingPiece[1] &&
        fallingPiece[0] + 2 == fallingPiece[2] &&
        fallingPiece[0] + 10 + 2 == fallingPiece[3]) {
      pieceNum = 13;
    } else if (fallingPiece[0] + 10 == fallingPiece[1] &&
        fallingPiece[0] + 20 == fallingPiece[3] &&
        fallingPiece[0] + 20 - 1 == fallingPiece[2]) {
      pieceNum = 14;
    } else if (fallingPiece[0] + 10 == fallingPiece[1] &&
        fallingPiece[0] + 10 + 1 == fallingPiece[2] &&
        fallingPiece[0] + 10 + 2 == fallingPiece[3]) {
      pieceNum = 15;
    } else if (fallingPiece[0] + 10 == fallingPiece[2] &&
        fallingPiece[0] + 10 - 1 == fallingPiece[1] &&
        fallingPiece[0] + 20 - 1 == fallingPiece[3]) {
      pieceNum = 16;
    } else if (fallingPiece[0] + 1 == fallingPiece[1] &&
        fallingPiece[0] + 10 + 1 == fallingPiece[2] &&
        fallingPiece[0] + 10 + 2 == fallingPiece[3]) {
      pieceNum = 17;
    }

    return pieceNum;
  }

  void rotatePiece() {
    fallingPiece.sort();
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

    if (fallingPiece.first % 10 == 9) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 - 2;
      fallingPiece[1] = fallingPiece[1] - 2;
      fallingPiece[2] = fallingPiece[2] - 10 + 1 - 2;
      fallingPiece[3] = fallingPiece[3] - 20 + 2 - 2;

    } else if (fallingPiece.first % 10 == 8) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 - 1;
      fallingPiece[1] = fallingPiece[1] - 1;
      fallingPiece[2] = fallingPiece[2] - 10 + 1 - 1;
      fallingPiece[3] = fallingPiece[3] - 20 + 2 - 1;

    } else if (fallingPiece.first % 10 == 0) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 + 1;
      fallingPiece[1] = fallingPiece[1] + 1;
      fallingPiece[2] = fallingPiece[2] - 10 + 1 + 1;
      fallingPiece[3] = fallingPiece[3] - 20 + 2 + 1;

    } else if (landed.contains(fallingPiece.first + 10 - 1)) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 + 1;
      fallingPiece[1] = fallingPiece[1] + 1;
      fallingPiece[2] = fallingPiece[2] - 10 + 1 + 1;
      fallingPiece[3] = fallingPiece[3] - 20 + 2 + 1;

    } else if (landed.contains(fallingPiece.first + 10 + 1)) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 - 2;
      fallingPiece[1] = fallingPiece[1] - 2;
      fallingPiece[2] = fallingPiece[2] - 10 + 1 - 2;
      fallingPiece[3] = fallingPiece[3] - 20 + 2 - 2;

    } else if (landed.contains(fallingPiece.first + 10 + 2)) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 - 1;
      fallingPiece[1] = fallingPiece[1] - 1;
      fallingPiece[2] = fallingPiece[2] - 10 + 1 - 1;
      fallingPiece[3] = fallingPiece[3] - 20 + 2 - 1;

    } else {
      fallingPiece[0] = fallingPiece[0] + 10 - 1;
      fallingPiece[1] = fallingPiece[1];
      fallingPiece[2] = fallingPiece[2] - 10 + 1;
      fallingPiece[3] = fallingPiece[3] - 20 + 2;

    }
  }

  void _rotate1to0() {
    if (fallingPiece.first + 10 > 179) {
      fallingPiece[0] = fallingPiece[0] - 10 + 1 - 20;
      fallingPiece[1] = fallingPiece[1] - 20;
      fallingPiece[2] = fallingPiece[2] + 10 - 1 - 20;
      fallingPiece[3] = fallingPiece[3] + 20 - 2 - 20;

    } else if (fallingPiece.first + 20 > 179) {
      fallingPiece[0] = fallingPiece[0] - 10 + 1 - 10;
      fallingPiece[1] = fallingPiece[1] - 10;
      fallingPiece[2] = fallingPiece[2] + 10 - 1 - 10;
      fallingPiece[3] = fallingPiece[3] + 20 - 2 - 10;

    } else if (landed.contains(fallingPiece.first + 10 + 1)) {
      fallingPiece[0] = fallingPiece[0] - 10 + 1 - 20;
      fallingPiece[1] = fallingPiece[1] - 20;
      fallingPiece[2] = fallingPiece[2] + 10 - 1 - 20;
      fallingPiece[3] = fallingPiece[3] + 20 - 2 - 20;

    } else if (landed.contains(fallingPiece.first + 20 + 1)) {
      fallingPiece[0] = fallingPiece[0] - 10 + 1 - 10;
      fallingPiece[1] = fallingPiece[1] - 10;
      fallingPiece[2] = fallingPiece[2] + 10 - 1 - 10;
      fallingPiece[3] = fallingPiece[3] + 20 - 2 - 10;

    } else {
      fallingPiece[0] = fallingPiece[0] - 10 + 1;
      fallingPiece[1] = fallingPiece[1];
      fallingPiece[2] = fallingPiece[2] + 10 - 1;
      fallingPiece[3] = fallingPiece[3] + 20 - 2;
    }
  }

  void _rotate2to3() {
    if (fallingPiece.first % 10 == 0) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 + 1;
      fallingPiece[1] = fallingPiece[1] + 1;
      fallingPiece[2] = fallingPiece[2] - 10 - 1 + 1;
      fallingPiece[3] = fallingPiece[3] - 20 + 1;

    } else if (landed.contains(fallingPiece.first + 10 - 1)) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 + 1;
      fallingPiece[1] = fallingPiece[1] + 1;
      fallingPiece[2] = fallingPiece[2] - 10 - 1 + 1;
      fallingPiece[3] = fallingPiece[3] - 20 + 1;

    } else {
      fallingPiece[0] = fallingPiece[0] + 10 - 1;
      fallingPiece[1] = fallingPiece[1];
      fallingPiece[2] = fallingPiece[2] - 10 - 1;
      fallingPiece[3] = fallingPiece[3] - 20;
    }
  }

  void _rotate3to2() {
    fallingPiece[0] = fallingPiece[0];
    fallingPiece[1] = fallingPiece[1] + 20;
    fallingPiece[2] = fallingPiece[2] + 2;
    fallingPiece[3] = fallingPiece[3];
  }

  void _rotate4to5() {
    fallingPiece[0] = fallingPiece[0];
    fallingPiece[1] = fallingPiece[1] + 10 + 1;
    fallingPiece[2] = fallingPiece[2];
    fallingPiece[3] = fallingPiece[3];
  }

  void _rotate5to6() {
    if (fallingPiece.first % 10 == 0) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 + 1;
      fallingPiece[1] = fallingPiece[1] + 1;
      fallingPiece[2] = fallingPiece[2] + 1;
      fallingPiece[3] = fallingPiece[3] + 1;

    } else if (landed.contains(fallingPiece.first + 10 - 1)) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 + 1;
      fallingPiece[1] = fallingPiece[1] + 1;
      fallingPiece[2] = fallingPiece[2] + 1;
      fallingPiece[3] = fallingPiece[3] + 1;

    } else {
      fallingPiece[0] = fallingPiece[0] + 10 - 1;
      fallingPiece[1] = fallingPiece[1];
      fallingPiece[2] = fallingPiece[2];
      fallingPiece[3] = fallingPiece[3];
    }
  }

  void _rotate6to7() {
    fallingPiece[0] = fallingPiece[0];
    fallingPiece[1] = fallingPiece[1];
    fallingPiece[2] = fallingPiece[2] - 10 - 1;
    fallingPiece[3] = fallingPiece[3];
  }

  void _rotate7to4() {
    if (fallingPiece.first % 10 == 9) {

      fallingPiece[0] = fallingPiece[0] - 1;
      fallingPiece[1] = fallingPiece[1] - 1;
      fallingPiece[2] = fallingPiece[2] - 1;
      fallingPiece[3] = fallingPiece[3] - 10 + 1 - 1;

    } else if (landed.contains(fallingPiece.first + 10 + 1)) {
      fallingPiece[0] = fallingPiece[0] - 1;
      fallingPiece[1] = fallingPiece[1] - 1;
      fallingPiece[2] = fallingPiece[2] - 1;
      fallingPiece[3] = fallingPiece[3] - 10 + 1 - 1;

    } else {
      fallingPiece[0] = fallingPiece[0];
      fallingPiece[1] = fallingPiece[1];
      fallingPiece[2] = fallingPiece[2];
      fallingPiece[3] = fallingPiece[3] - 10 + 1;
    }
  }

  void _rotate8to9() {
    fallingPiece[0] = fallingPiece[0] + 2;
    fallingPiece[1] = fallingPiece[1] + 10 + 1;
    fallingPiece[2] = fallingPiece[2];
    fallingPiece[3] = fallingPiece[3] - 10 - 1;
  }

  void _rotate9to10() {
    fallingPiece[0] = fallingPiece[0] - 10 - 1 - 1;
    fallingPiece[1] = fallingPiece[1] - 10 + 1 - 1;
    fallingPiece[2] = fallingPiece[2] - 1;
    fallingPiece[3] = fallingPiece[3] - 1;
  }

  void _rotate10to11() {
    if (fallingPiece.last % 10 == 9) {
      fallingPiece[0] = fallingPiece[0] + 10 + 2 - 1;
      fallingPiece[1] = fallingPiece[1] - 1;
      fallingPiece[2] = fallingPiece[2] - 1;
      fallingPiece[3] = fallingPiece[3] - 10 - 1;

    } else if (landed.contains(fallingPiece.first + 10 + 2)) {
      fallingPiece[0] = fallingPiece[0] + 10 + 2 - 1;
      fallingPiece[1] = fallingPiece[1] - 1;
      fallingPiece[2] = fallingPiece[2] - 1;
      fallingPiece[3] = fallingPiece[3] - 10 - 1;

    } else {
      fallingPiece[0] = fallingPiece[0] + 10 + 2;
      fallingPiece[1] = fallingPiece[1];
      fallingPiece[2] = fallingPiece[2];
      fallingPiece[3] = fallingPiece[3] - 10;

    }
  }

  void _rotate11to8() {
    fallingPiece[0] = fallingPiece[0] - 10;
    fallingPiece[1] = fallingPiece[1];
    fallingPiece[2] = fallingPiece[2] - 10 - 1;
    fallingPiece[3] = fallingPiece[3] + 1;
  }

  void _rotate12to13() {
    fallingPiece[0] = fallingPiece[0];
    fallingPiece[1] = fallingPiece[1];
    fallingPiece[2] = fallingPiece[2] - 10 - 1;
    fallingPiece[3] = fallingPiece[3] - 10 + 1;
  }

  void _rotate13to14() {
    fallingPiece[0] = fallingPiece[0] - 10 + 2;
    fallingPiece[1] = fallingPiece[1] + 10;
    fallingPiece[2] = fallingPiece[2];
    fallingPiece[3] = fallingPiece[3];
  }

  void _rotate14to15() {
    if (fallingPiece.last % 10 == 9) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 - 1;
      fallingPiece[1] = fallingPiece[1] + 10 + 1 - 1;
      fallingPiece[2] = fallingPiece[2] - 1;
      fallingPiece[3] = fallingPiece[3] - 1;
    } else {
      fallingPiece[0] = fallingPiece[0] + 10 - 1;
      fallingPiece[1] = fallingPiece[1] + 10 + 1;
      fallingPiece[2] = fallingPiece[2];
      fallingPiece[3] = fallingPiece[3];
    }
  }

  void _rotate15to12() {
    fallingPiece[0] = fallingPiece[0];
    fallingPiece[1] = fallingPiece[1];
    fallingPiece[2] = fallingPiece[2] - 20;
    fallingPiece[3] = fallingPiece[3] - 20 - 2;
  }

  void _rotate16to17() {

    if (fallingPiece.first % 10 == 1) {
      fallingPiece[0] = fallingPiece[0] + 10 - 2 + 1;
      fallingPiece[1] = fallingPiece[1] + 1;
      fallingPiece[2] = fallingPiece[2] + 10 - 1 + 1;
      fallingPiece[3] = fallingPiece[3] + 1 + 1;

    } else if (landed.contains(fallingPiece.first + 10 - 1)) {
      fallingPiece[0] = fallingPiece[0] + 10 - 1 + 1;
      fallingPiece[1] = fallingPiece[1] + 1;
      fallingPiece[2] = fallingPiece[2] - 10 - 1 + 1;
      fallingPiece[3] = fallingPiece[3] - 20 + 1;

    } else if (landed.contains(fallingPiece.first + 10 - 2)) {
      fallingPiece[0] = fallingPiece[0] + 10 - 2 + 1;
      fallingPiece[1] = fallingPiece[1] + 1;
      fallingPiece[2] = fallingPiece[2] + 10 - 1 + 1;
      fallingPiece[3] = fallingPiece[3] + 1 + 1;

    } else {
      fallingPiece[0] = fallingPiece[0] + 10 - 2;
      fallingPiece[1] = fallingPiece[1];
      fallingPiece[2] = fallingPiece[2] + 10 - 1;
      fallingPiece[3] = fallingPiece[3] + 1;
    }
  }

  void _rotate17to16() {
    fallingPiece[0] = fallingPiece[0] + 1;
    fallingPiece[1] = fallingPiece[1] + 1;
    fallingPiece[2] = fallingPiece[2] - 1 + 1;
    fallingPiece[3] = fallingPiece[3] - 1 - 20 + 1;
  }
}