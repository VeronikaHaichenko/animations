import 'package:animations_course/menu/widget/custom_button.dart';
import 'package:flutter/material.dart';

import 'functions.dart';

class TransformPage extends StatefulWidget {
  const TransformPage({super.key});

  @override
  State<TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
  double _scale = 1;
  double _angle = 0;
  Offset _offset = Offset(0, 0);
  double _alpha = 0;
  double _beta = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Transform'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 9,
                    spreadRadius: 0.7,
                  ),
                ],
              ),
              child: Transform.scale(
                scale: _scale,
                child: Transform.rotate(
                  angle: _angle,
                  child: Transform.translate(
                    offset: _offset,
                    child: Transform(
                      transform: Matrix4.skew(_alpha, _beta),
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.pink[200],
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              title: 'Transform scale',
              onTap: () {
                setState(() {
                  _scale = Functions.getRandomValue(max: 1);
                });
              },
            ),
            CustomButton(
              title: 'Transform rotate',
              onTap: () {
                setState(() {
                  _angle = Functions.getRandomValue(max: 360);
                });
              },
            ),
            CustomButton(
              title: 'Transform translate',
              onTap: () {
                setState(() {
                  _offset = Offset(Functions.getRandomValueWithNegative(max: 50), Functions.getRandomValueWithNegative(max: 50));
                });
              },
            ),
            CustomButton(
              title: 'Transform skew',
              onTap: () {
                setState(() {
                  _alpha = Functions.getRandomValueWithNegative(max: 1) / 2;
                  _beta = Functions.getRandomValueWithNegative(max: 1) / 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
