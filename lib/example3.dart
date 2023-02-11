import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> with TickerProviderStateMixin {
  final double z = 100;

  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );
    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _xController
      ..reset()
      ..repeat();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
              width: double.infinity,
            ),
            AnimatedBuilder(
                animation: Listenable.merge([
                  _xController,
                  _yController,
                  _zController,
                ]),
                builder: (context, _) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateX(_animation.evaluate(_xController))
                      ..rotateY(_animation.evaluate(_yController))
                      ..rotateZ(_animation.evaluate(_zController)),
                    child: Stack(
                      children: [
                        //back
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..translate(
                              Vector3(0, 0, -z),
                            ),
                          child: Container(
                            height: z,
                            width: z,
                            color: Colors.purple[100],
                          ),
                        ),
                        //leftSide
                        Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.identity()..rotateY(pi / 2),
                          child: Container(
                            height: z,
                            width: z,
                            color: Colors.lightBlueAccent[100],
                          ),
                        ),
                        //rightSide
                        Transform(
                          alignment: Alignment.centerRight,
                          transform: Matrix4.identity()..rotateY(-(pi / 2)),
                          child: Container(
                            height: z,
                            width: z,
                            color: Colors.greenAccent[100],
                          ),
                        ),
                        //top
                        Transform(
                          alignment: Alignment.topCenter,
                          transform: Matrix4.identity()..rotateX(-(pi / 2)),
                          child: Container(
                            height: z,
                            width: z,
                            color: Colors.pink[100],
                          ),
                        ),
                        //bottom
                        Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()..rotateX(pi / 2),
                          child: Container(
                            height: z,
                            width: z,
                            color: Colors.blueAccent[100],
                          ),
                        ),
                        //front
                        Container(
                          height: z,
                          width: z,
                          color: Colors.yellow[100],
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
