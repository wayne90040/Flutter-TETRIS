


import 'game_controller.dart';

extension Roatate on GameController {

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

    } else if (landed.contains(beenChosenPiece.first + 10 - 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 + 1 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 2 + 1;

    } else if (landed.contains(beenChosenPiece.first + 10 + 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 - 2;
      beenChosenPiece[1] = beenChosenPiece[1] - 2;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 + 1 - 2;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 2 - 2;

    } else if (landed.contains(beenChosenPiece.first + 10 + 2)) {
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

    } else if (landed.contains(beenChosenPiece.first + 10 + 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] - 10 + 1 - 20;
      beenChosenPiece[1] = beenChosenPiece[1] - 20;
      beenChosenPiece[2] = beenChosenPiece[2] + 10 - 1 - 20;
      beenChosenPiece[3] = beenChosenPiece[3] + 20 - 2 - 20;

    } else if (landed.contains(beenChosenPiece.first + 20 + 1)) {
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

    } else if (landed.contains(beenChosenPiece.first + 10 - 1)) {
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

    } else if (landed.contains(beenChosenPiece.first + 10 - 1)) {
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

    } else if (landed.contains(beenChosenPiece.first + 10 + 1)) {
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

    } else if (landed.contains(beenChosenPiece.first + 10 + 2)) {
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

    } else if (landed.contains(beenChosenPiece.first + 10 - 1)) {
      beenChosenPiece[0] = beenChosenPiece[0] + 10 - 1 + 1;
      beenChosenPiece[1] = beenChosenPiece[1] + 1;
      beenChosenPiece[2] = beenChosenPiece[2] - 10 - 1 + 1;
      beenChosenPiece[3] = beenChosenPiece[3] - 20 + 1;

    } else if (landed.contains(beenChosenPiece.first + 10 - 2)) {
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