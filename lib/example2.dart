import 'dart:math';

import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    var path = Path();
    late Offset offset;
    bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path
      ..arcToPoint(
        offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockwise,
      )
      ..close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  const HalfCircleClipper({
    required this.side,
  });

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(
        duration,
        this,
      );
}

class _Example2State extends State<Example2> with TickerProviderStateMixin {
  final double x = 150;
  final double y = 150;
  late AnimationController _counterClockwiseAnimationController;
  late Animation<double> _counterClockwiseRotationAnimation;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _counterClockwiseAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2),
    ).animate(
      CurvedAnimation(
        parent: _counterClockwiseAnimationController,
        curve: Curves.bounceOut,
      ),
    );
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(
      CurvedAnimation(
        parent: _flipController,
        curve: Curves.bounceOut,
      ),
    );

    //status
    _counterClockwiseAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
          begin: _flipAnimation.value,
          end: _flipAnimation.value + pi,
        ).animate(
          CurvedAnimation(
            parent: _flipController,
            curve: Curves.bounceOut,
          ),
        );

        //reset flipController and start the animation
        _flipController
          ..reset()
          ..forward();
      }
    });

    _flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterClockwiseRotationAnimation = Tween<double>(
          begin: _counterClockwiseRotationAnimation.value,
          end: _counterClockwiseRotationAnimation.value - (pi / 2),
        ).animate(
          CurvedAnimation(
            parent: _counterClockwiseAnimationController,
            curve: Curves.bounceOut,
          ),
        );
        _counterClockwiseAnimationController
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    _counterClockwiseAnimationController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counterClockwiseAnimationController
      ..reset()
      ..forward.delayed(
        const Duration(seconds: 1),
      );

    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
            animation: _counterClockwiseAnimationController,
            builder: (context, _) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateZ(
                    _counterClockwiseRotationAnimation.value,
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                        animation: _flipController,
                        builder: (context, _) {
                          return Transform(
                            alignment: Alignment.centerRight,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: ClipPath(
                              clipper: const HalfCircleClipper(side: CircleSide.left),
                              child: Container(
                                height: y,
                                width: x,
                                color: const Color(0xFF0057B7),
                              ),
                            ),
                          );
                        }),
                    AnimatedBuilder(
                        animation: _flipController,
                        builder: (context, _) {
                          return Transform(
                            alignment: Alignment.centerLeft,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: ClipPath(
                              clipper: const HalfCircleClipper(side: CircleSide.right),
                              child: Container(
                                height: y,
                                width: x,
                                color: const Color(0xFFFFD700),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
