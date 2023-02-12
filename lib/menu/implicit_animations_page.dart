import 'dart:math';

import 'package:animations_course/menu/widget/custom_button.dart';
import 'package:flutter/material.dart';

import 'functions.dart';

class ImplicitAnimationsPage extends StatefulWidget {
  const ImplicitAnimationsPage({super.key});

  @override
  State<ImplicitAnimationsPage> createState() => _ImplicitAnimationsPageState();
}

class _ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {
  final Duration _duration = const Duration(milliseconds: 500);
  double _width = 100;
  double _height = 100;
  double _opacity = 1;
  double _angle = 0;
  double _borderRadius = 0;
  Color _color = Colors.pink[100]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Implicit Animations'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: _duration,
              child: AnimatedContainer(
                duration: _duration,
                height: _height,
                width: _width,
                transform: Matrix4.identity()..rotateZ(_angle),
                transformAlignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _color,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              title: 'Change look',
              onTap: () {
                setState(() {
                  _opacity = Functions.getRandomValue(max: 1);
                  _borderRadius = Functions.getRandomValue(max: 40);
                  _color = Functions.getRandomColor();
                });
              },
            ),
            CustomButton(
              title: 'Change size',
              onTap: () {
                setState(() {
                  _height = Functions.getRandomValue(max: 200);
                  _width = Functions.getRandomValue(max: 200);
                });
              },
            ),
            CustomButton(
              title: 'Rotate',
              onTap: () {
                setState(() {
                  _angle = Functions.getRandomValue(max: 360);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
