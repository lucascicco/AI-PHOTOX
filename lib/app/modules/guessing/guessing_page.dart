import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tflite/tflite.dart';

import 'guessing_controller.dart';

class GuessingPage extends StatefulWidget {
  const GuessingPage({Key key}) : super(key: key);

  @override
  _GuessingPageState createState() => _GuessingPageState();
}

class _GuessingPageState extends ModularState<GuessingPage, GuessingController>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Modular.get();

  bool loading = true;
  List output;
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 3),
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: homeController.currentImage.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      output = output;
      loading = false;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    _controller.dispose();
    super.dispose();
  }

  Widget buttonChoose(bool boolean, IconData icon, String text, Color color) {
    return ElevatedButton(
        onPressed: () => {controller.addBoolean(boolean)},
        style: ElevatedButton.styleFrom(
          primary: color, // background
        ),
        child: Row(children: <Widget>[
          Icon(icon, color: Colors.white),
          Text(text, style: TextStyle(color: Colors.white))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(controller.listTrue.toString(),
            style: TextStyle(color: Colors.green)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.camera, color: Colors.yellow),
            SizedBox(width: 10),
            Text('AI Photox')
          ],
        ),
        actions: [
          Text(controller.listFalse.toString(),
              style: TextStyle(color: Colors.red)),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (loading)
            Container(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  TypewriterAnimatedTextKit(
                    text: ["Aguarde...", "Estamos desvendando a imagem..."],
                    textStyle: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.start,
                    speed: Duration(milliseconds: 100),
                  ),
                ],
              ),
            ),
          if (!loading)
            FadeTransition(
                opacity: animation,
                child: Column(
                  children: <Widget>[
                    Image.file(File(homeController.currentImage.path)),
                    buttonChoose(
                        true, Icons.check, 'Correto', Colors.greenAccent[100]),
                    buttonChoose(
                        false, Icons.close, 'Errado', Colors.redAccent[200]),
                  ],
                )),
        ],
      ),
    );
  }
}
