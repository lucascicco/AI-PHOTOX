import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final picker = ImagePicker();

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    print(image);

    if (image == null) return null;

    controller.updateCurrentImage(image);

    Modular.to.pushReplacementNamed('/guess');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.camera, color: Colors.yellow),
              SizedBox(width: 10),
              Text('AI Photox')
            ],
          ),
          backgroundColor: Colors.grey[600],
        ),
        body: Container(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: pickImage,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[600], // background
                      ),
                      child: Column(children: <Widget>[
                        Icon(Icons.camera_alt_sharp, color: Colors.yellow),
                        Text('Tire uma foto',
                            style: TextStyle(color: Colors.white))
                      ]))
                ]),
          ),
        ));
  }
}
