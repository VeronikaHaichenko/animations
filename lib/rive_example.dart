import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveExample extends StatefulWidget {
  const RiveExample({super.key});

  @override
  State<RiveExample> createState() => _RiveExampleState();
}

class _RiveExampleState extends State<RiveExample> {
  double _rating = 0;
  SMINumber? _ratingInput;
  Artboard? _ratingArtboard;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animations/rating_animation.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(
        artboard,
        'State Machine 1',
      );
      if (controller != null) {
        artboard.addController(controller);
        _ratingInput = controller.findSMI('rating');
      }
      setState(() {
        _ratingArtboard = artboard;
      });
    });
  }

  void _onChange(double value) {
    if (_rating == value) return;
    setState(() {
      _rating = value;
      _ratingInput?.value = value;
    });
    print(_ratingInput);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ratingArtboard == null
                ? const SizedBox()
                : Container(
                    alignment: Alignment.center,
                    height: 120,
                    width: double.infinity,
                    child: Rive(
                      artboard: _ratingArtboard!,
                      fit: BoxFit.fitWidth,
                    ),
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
                  value: _rating,
                  min: 0,
                  max: 5,
                  divisions: 5,
                  thumbColor: Colors.white,
                  activeColor: Colors.white70,
                  inactiveColor: Colors.white24,
                  onChanged: _onChange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
