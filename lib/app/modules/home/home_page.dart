import 'package:Aiphotox/app/widgets/elevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final picker = ImagePicker();

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;

    controller.updateCurrentImage(image);

    //go to next route
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
        backgroundColor: Colors.white,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedCustomButton(
                color: Colors.yellow,
                icon: Icons.camera_alt_sharp,
                text: 'Tire uma foto',
                onPressed: pickImage)
          ]),
    );
  }
}
