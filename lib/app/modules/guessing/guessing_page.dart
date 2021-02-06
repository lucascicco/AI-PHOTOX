import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'guessing_controller.dart';

class GuessingPage extends StatefulWidget {
  final String title;
  const GuessingPage({Key key, this.title = "Guessing"}) : super(key: key);

  @override
  _GuessingPageState createState() => _GuessingPageState();
}

class _GuessingPageState
    extends ModularState<GuessingPage, GuessingController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
