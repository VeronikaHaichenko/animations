import 'dart:math';

import 'package:flutter/material.dart';

class TweenColors extends StatefulWidget {
  const TweenColors({super.key});

  @override
  State<TweenColors> createState() => _TweenColorsState();
}

Color getRandomColor() => Color(
      0xFF000000 + Random().nextInt(0x00FFFFFF),
    );

class _TweenColorsState extends State<TweenColors> {
  Color _color = getRandomColor();
/*
  A R G B - 32 bits:
    A = Alpha (0 - 255) - 8 bits - oppacity
    R = Red (0 - 255) - 8 bits
    G = Green (0 - 255) - 8 bits
    B = Blue (0 - 255) - 8 bits

  Example:
  0xFFFFFFFF - 0xFF(Alpha 255)FF(Red 255)FF(Green 255)FF(Blue 255)
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
            tween: ColorTween(begin: getRandomColor(), end: _color),
            duration: const Duration(seconds: 1),
            onEnd: () => setState(() {
                  _color = getRandomColor();
                }),
            builder: (context, color, _) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              );
            }),
      ),
    );
  }
}
