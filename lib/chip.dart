import 'dart:math';

import 'package:flutter/material.dart';

class Chip extends StatefulWidget {
  const Chip({super.key});

  @override
  State<Chip> createState() => _ChipState();
}

enum Face {
  front,
  back,
}

extension on Face {
  String get text {
    switch (this) {
      case Face.front:
        return 'Morning!';
      case Face.back:
        return 'Evening!';
    }
  }

  AssetImage get image {
    switch (this) {
      case Face.front:
        return const AssetImage('assets/images/sun.png');
      case Face.back:
        return const AssetImage('assets/images/moon.png');
    }
  }
}

class _ChipState extends State<Chip> {
  late final ChipWidget front;
  late final ChipWidget back;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();

    front = ChipWidget(
      face: Face.front,
      onTap: () {
        setState(() {
          _isFront = false;
        });
      },
    );

    back = ChipWidget(
      face: Face.back,
      onTap: () {
        setState(() {
          _isFront = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _isFront ? 0 : pi),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          builder: (context, double value, child) {
            final isBack = value > pi / 2;
            final display = isBack ? back : front;
            return Transform(
              transform: Matrix4.identity()..rotateY(value),
              alignment: Alignment.center,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(isBack ? pi : 0),
                child: display,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final Face face;
  final VoidCallback onTap;

  const ChipWidget({
    super.key,
    required this.face,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: face == Face.front ? Colors.yellow[100] : Colors.blue[900],
          border: Border.all(
            width: 4,
            color: Colors.white,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: face.image,
              height: 170,
              width: 170,
            ),
            Text(
              face.text,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(1, 2),
                    blurRadius: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
