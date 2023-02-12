import 'package:animations_course/menu/widget/custom_button.dart';
import 'package:flutter/material.dart';

class AnimationCurvesPage extends StatefulWidget {
  const AnimationCurvesPage({super.key});

  @override
  State<AnimationCurvesPage> createState() => _AnimationCurvesPageState();
}

class _AnimationCurvesPageState extends State<AnimationCurvesPage> {
  double _width = 110;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animation Curves'),
        automaticallyImplyLeading: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CurveDisplay(curveName: 'Linear', curve: Curves.linear, width: _width),
            CurveDisplay(curveName: 'Slow Middle', curve: Curves.slowMiddle, width: _width),
            CurveDisplay(curveName: 'Bounce In', curve: Curves.bounceIn, width: _width),
            CurveDisplay(curveName: 'Bounce out', curve: Curves.bounceOut, width: _width),
            CurveDisplay(curveName: 'Decelerate', curve: Curves.decelerate, width: _width),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Animate',
              onTap: () {
                setState(() {
                  _width = 300;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              title: 'Reset',
              onTap: () {
                setState(() {
                  _width = 110;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CurveDisplay extends StatelessWidget {
  const CurveDisplay({
    Key? key,
    required double width,
    required this.curveName,
    required this.curve,
  })  : _width = width,
        super(key: key);

  final double _width;
  final String curveName;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _width,
      padding: const EdgeInsets.all(12),
      curve: curve,
      margin: const EdgeInsets.only(bottom: 18),
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 700),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Text(
        curveName,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
