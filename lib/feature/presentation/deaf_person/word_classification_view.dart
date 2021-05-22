import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class WordClassificationView extends StatefulWidget {
  @override
  WordClassificationViewState createState() => WordClassificationViewState();
}

class WordClassificationViewState extends State {
  File imageURI;
  String result;
  String path;

//getting images from camera
  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      imageURI = image;
      path = image.path;
    });
  }
//getting images from gallery
  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
      path = image.path;
    });
  }
//prediction of input images
  Future classifyImage() async {
    await Tflite.loadModel(
        model: "assets/converted_model.tflite", labels: "assets/labels.txt");
    var output = await Tflite.runModelOnImage(
        path: path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);

    setState(() {
      print(output);
      result = output[0]['label'].toString().split(" ")[1].toString();
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[800],
          centerTitle: true,
          title: Text(
            'Sign to word translation',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          imageURI == null
              ? Text(
                  'No image selected.',
                  style: TextStyle(fontSize: 20),
                )
              : Image.file(imageURI,
                  width: 224, height: 224, fit: BoxFit.cover),
          Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: RaisedButton(
                onPressed: () => getImageFromCamera(),
                child: Text('Click Here To Select Image From Camera'),
                textColor: Colors.white,
                color: Colors.amber[800],
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: RaisedButton(
                onPressed: () => getImageFromGallery(),
                child: Text('Click Here To Select Image From Gallery'),
                textColor: Colors.white,
                color: Colors.amber[800],
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: RaisedButton(
                onPressed: () => classifyImage(),
                child: Text('Classify Image'),
                textColor: Colors.white,
                color: Colors.amber[800],
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          result == null
              ? Text(
                  'Result',
                  style: TextStyle(fontSize: 18),
                )
              : Text(
                  "Detected sign"  ,
                  style: TextStyle(fontSize: 15),
                ),
          result == null
              ? Container()
              : Text(
                  result,
                  style: TextStyle(fontSize: 20,color: Colors.blueAccent),
                )
        ])));
  }
}
