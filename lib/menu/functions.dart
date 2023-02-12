import 'dart:math';

import 'package:flutter/material.dart';

class Functions {
  static double getRandomValue({required int max}) {
    return Random().nextDouble() * max;
  }

  static double getRandomValueWithNegative({required int max}) {
    return (Random().nextDouble() * max) * (Random().nextBool() ? 1 : -1);
  }

  static Color getRandomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }
}
