import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class FirstBox extends StatefulWidget {
  const FirstBox({super.key});

  @override
  State<FirstBox> createState() => _FirstBoxState();
}

class _FirstBoxState extends State<FirstBox> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        child: AnimatedContainer(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: _isPressed ? Colors.yellow : Colors.red,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0))),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: const Text("Bonjour 1")));
  }
}

class MonSlider extends StatefulWidget {
  const MonSlider({super.key});

  @override
  State<MonSlider> createState() => _MonSliderState();
}

class _MonSliderState extends State<MonSlider> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: _sliderValue,
        min: 0,
        max: 100,
        divisions: 100,
        label: _sliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _sliderValue = value;
          });
        });
  }
}

class MonAnimation extends StatefulWidget {
  const MonAnimation({super.key});

  @override
  State<MonAnimation> createState() => _MonAnimationState();
}

class _MonAnimationState extends State<MonAnimation>
    with TickerProviderStateMixin {
  bool _isPressed = false;

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);

  @override
  Widget build(BuildContext context) {
    if (_isPressed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return DecoratedBoxTransition(
        decoration: DecorationTween(
                begin: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0))),
                end: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))))
            .animate(_controller),
        child: GestureDetector(
            onTap: () {
              setState(() {
                _isPressed = !_isPressed;
              });
            },
            child: const Padding(
                padding: EdgeInsets.all(10), child: Text("Bonjour 1"))));
  }
}

// MY APP

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          appBar: AppBar(
              leading: const FlutterLogo(
                size: 50.0,
                style: FlutterLogoStyle.stacked,
              ),
              title: const Text("My Flutter App")),
          body: Center(
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const FirstBox(),
                      ClipOval(
                          child: Container(
                              height: 100,
                              width: 100,
                              color: Colors.blue,
                              child: const Center(child: Text("Bonjour 2")))),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.red,
                            child: const Text("Bonjour 3")),
                      ),
                      const MonSlider(),
                      const MonAnimation()
                    ])),
          )),
    );
  }
}
