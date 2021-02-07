import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Duration duration = Duration(seconds: 2);

  bool animateIt = false;
  int finished = 3;

  void startAnimation() {
    Timer.periodic(duration, (timer) {
      if (finished == 0) {
        return Modular.to.pushReplacementNamed('/home');
      }
      setState(() {
        animateIt = !animateIt;
        finished--;
      });
    });
  }

  @override
  void initState() {
    startAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.white,
                  Colors.yellow[200],
                  Colors.yellow[500],
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            width: animateIt
                ? constraints.maxWidth * 0.4
                : constraints.maxWidth * 0.8,
            height: animateIt
                ? constraints.maxHeight * 0.4
                : constraints.maxHeight * 0.8,
            curve: Curves.bounceInOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.camera_alt_sharp,
                    color: Colors.yellow, size: double.infinity),
                Text('AI Photox', style: TextStyle(color: Colors.black))
              ],
            ),
          )
        ],
      );
    });
  }
}
