import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/models/ssd_mobilenet.tflite",
      labels: "assets/models/labels.txt",
    );
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 3),
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    loadTfModel();

    ssdMobileNet();

    super.initState();
  }

  ssdMobileNet() async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: homeController.currentImage.path, numResultsPerClass: 1);

    var listResult = [];

    recognitions.forEach((element) {
      return listResult.add(element["detectedClass"]);
    });

    setState(() {
      output = listResult;
      loading = false;
    });
  }

  void goBack(bool boolean) async {
    controller.addBoolean(boolean);

    await Future.delayed(Duration(seconds: 2));

    Modular.to.pushReplacementNamed('/home');
  }

  @override
  void dispose() {
    Tflite.close();
    _controller.dispose();
    super.dispose();
  }

  Widget buttonChoose(bool boolean, IconData icon, String text, Color color) {
    return ElevatedButton(
        onPressed: () => goBack(boolean),
        style: ElevatedButton.styleFrom(
          primary: color, // background
        ),
        child: Row(children: <Widget>[
          Icon(icon, color: Colors.white),
          Text(text, style: TextStyle(color: Colors.white))
        ]));
  }

  Widget loadingScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Container(
          margin: EdgeInsets.only(top: 25.0),
          width: double.infinity,
          height: 90,
          child: TypewriterAnimatedTextKit(
            text: ["Aguarde...", "Estamos desvendando a imagem para você..."],
            textStyle: TextStyle(fontSize: 30.0, color: Colors.black),
            textAlign: TextAlign.center,
            speed: Duration(milliseconds: 100),
          ),
        ),
      ],
    );
  }

  Widget renderScreen(BoxConstraints constraints) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: constraints.maxWidth * 0.7,
          height: constraints.maxHeight * 0.4,
          margin: EdgeInsets.only(bottom: 15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              File(homeController.currentImage.path),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: constraints.maxHeight * 0.1,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: output.length,
              itemBuilder: (context, index) {
                return Container(
                  width: constraints.maxWidth * 0.5,
                  child: Card(
                    color: Colors.yellow[800],
                    child: Container(
                      child: Center(
                          child: Text(
                        output[index].toString().toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      )),
                    ),
                  ),
                );
              }),
        ),
        Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              buttonChoose(true, Icons.check, 'Correto', Colors.green[300]),
              buttonChoose(false, Icons.close, 'Errado', Colors.redAccent[200]),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Observer(
            builder: (_) => Text(controller.listTrue.toString(),
                style: TextStyle(color: Colors.green, fontSize: 30)),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.camera, color: Colors.yellow),
            SizedBox(width: 10),
            Text('AI Photox')
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(right: 5.0),
            child: Center(
              child: Observer(
                builder: (_) => Text(controller.listFalse.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 30)),
              ),
            ),
          )
        ],
        backgroundColor: Colors.grey[600],
      ),
      body: LayoutBuilder(
          builder: (context, constraints) => Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: loading ? loadingScreen() : renderScreen(constraints))),
    );
  }
}
