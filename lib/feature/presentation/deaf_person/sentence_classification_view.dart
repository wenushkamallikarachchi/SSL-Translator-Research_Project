import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class SentenceClassificationView extends StatefulWidget {
  @override
  SentenceClassificationViewState createState() => SentenceClassificationViewState();
}

class SentenceClassificationViewState extends State {
  File imageURI;
  String result;
  String path;
  List<String> reslutList = [];

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      imageURI = image;
      path = image.path;
    });

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
      print(output[0]['label'].toString().split(" ")[1].toString());
      String value = output[0]['label'].toString().split(" ")[1].toString();
      reslutList.add(value);
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
      path = image.path;
    });

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
      print(output[0]['label'].toString().split(" ")[1].toString());
      String value = output[0]['label'].toString().split(" ")[1].toString();
      reslutList.add(value);
    });
  }

  void classifyImage() {
    var concatenate = StringBuffer();
    setState(() {
      reslutList.forEach((item) {
        concatenate.write(item + " ");
      });

      result = concatenate.toString();
    });
    reslutList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[800],
          centerTitle: true,
          title: Text(
            'Sign to Sentence translation',
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
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                child: Text('Get the sentence'),
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
                  result,
                  style: TextStyle(fontSize: 18,color: Colors.blueAccent),
                )
        ])));
  }
}
