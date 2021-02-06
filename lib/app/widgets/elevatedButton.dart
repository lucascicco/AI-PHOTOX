import 'package:flutter/material.dart';

class ElevatedCustomButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function onPressed;

  const ElevatedCustomButton({
    Key key,
    this.color,
    this.icon,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white, // background
        ),
        child: Column(children: <Widget>[
          Icon(icon, color: Colors.black),
          Text(text, style: TextStyle(color: Colors.black))
        ]));
  }
}
