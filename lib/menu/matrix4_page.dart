import 'package:flutter/material.dart';

class Matrix4Page extends StatefulWidget {
  const Matrix4Page({super.key});

  @override
  State<Matrix4Page> createState() => _Matrix4PageState();
}

class _Matrix4PageState extends State<Matrix4Page> {
  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Matrix4'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4(
                //x access
                1, 0, 0, 0,
                //y access
                0, 1, 0, 0,
                //z access
                0, 0, 1, 0.002,
                //scaling
                0, 0, 0, 1,
                //
              )
                ..rotateX(x)
                ..rotateY(y)
                ..rotateZ(z),
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    x = x + details.delta.dy / 100;
                    y = y - details.delta.dx / 100;
                  });
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.yellow[200],
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
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black38,
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Try to rotate square by gestures :)',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
