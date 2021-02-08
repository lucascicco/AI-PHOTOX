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

  pickImage(ImageSource source) async {
    var image = await picker.getImage(source: source);

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.search, size: 40),
              SizedBox(width: 10),
              Text('O que há na foto?',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  )),
            ]),
            SizedBox(height: 40),
            Container(
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.symmetric(horizontal: 65),
                child: Column(children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () => pickImage(ImageSource.camera),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[500], // background
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 5),
                                  Icon(Icons.camera_alt_sharp,
                                      color: Colors.amberAccent[100], size: 30),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text('Tire uma foto',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0)),
                                  )
                                ])),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () => pickImage(ImageSource.gallery),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[500], // background
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 5),
                                  Icon(Icons.photo_album_sharp,
                                      color: Colors.amberAccent[100], size: 30),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text('Escolha uma foto',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0)),
                                  )
                                ])),
                      ),
                    ],
                  ),
                ])),
          ]),
        ));
  }
}
