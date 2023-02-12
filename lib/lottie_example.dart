import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExample extends StatefulWidget {
  const LottieExample({super.key});

  @override
  State<LottieExample> createState() => _LottieExampleState();
}

class _LottieExampleState extends State<LottieExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Widget likeWidget;
  bool _isLiked = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    likeWidget = Lottie.asset(
      'assets/animations/like.json',
      controller: _controller,
      onLoaded: (file) => _controller.duration = file.duration,
    );
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: Lottie.asset('assets/animations/bird.json'),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (!_isLiked) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  child: SizedBox(
                    height: 75,
                    width: 75,
                    child: likeWidget,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
