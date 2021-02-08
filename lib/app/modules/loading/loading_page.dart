import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Duration duration = Duration(seconds: 4);

  bool animateIt = false;

  void startAnimation() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      animateIt = true;
    });

    await Future.delayed(Duration(seconds: 4));

    Modular.to.pushReplacementNamed('/home');
  }

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                        height: animateIt ? constraints.maxHeight * 0.5 : 50,
                        width: animateIt ? constraints.maxWidth * 0.8 : 70,
                        margin: EdgeInsets.only(bottom: 50.0),
                        duration: duration,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(animateIt ? 25.0 : 0),
                        ),
                        child: Image.asset(
                          'assets/dribbble-cm.gif',
                          fit: BoxFit.fill,
                        )),
                    AnimatedDefaultTextStyle(
                        duration: duration,
                        style: animateIt
                            ? TextStyle(
                                fontSize: 65.0,
                                color: Colors.yellowAccent[700],
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                fontSize: 40.0,
                                color: Colors.yellowAccent[400]),
                        child: Text('AI Photox'))
                  ]),
            )
          ],
        );
      }),
    );
  }
}
