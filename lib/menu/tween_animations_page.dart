import 'package:animations_course/menu/widget/custom_button.dart';
import 'package:flutter/material.dart';

class TweenAnimationsPage extends StatefulWidget {
  const TweenAnimationsPage({super.key});

  @override
  State<TweenAnimationsPage> createState() => _TweenAnimationsPageState();
}

class _TweenAnimationsPageState extends State<TweenAnimationsPage> with SingleTickerProviderStateMixin {
  double _scale = 1.5;
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = ColorTween(
      begin: Colors.deepOrange,
      end: Colors.deepPurple,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tween Animations'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 500),
                tween: Tween(begin: _scale, end: _scale),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Image.asset(
                            'assets/images/heart.png',
                            color: _animation.value,
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  tickMarkShape: const RoundSliderTickMarkShape(
                    tickMarkRadius: 0,
                  ),
                ),
                child: Slider(
                  value: _scale,
                  min: 0.1,
                  max: 3,
                  divisions: 10,
                  thumbColor: Colors.white,
                  activeColor: Colors.white70,
                  inactiveColor: Colors.white24,
                  onChanged: (value) {
                    setState(() {
                      _scale = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Change color',
              onTap: () {
                if (_controller.isCompleted) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
