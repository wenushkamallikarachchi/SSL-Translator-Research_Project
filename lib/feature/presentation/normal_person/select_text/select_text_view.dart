import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:tflite_example/feature/data/data_Source/const.dart';

class SelectTextView extends StatefulWidget {
  @override
  SelectTextViewState createState() => SelectTextViewState();
}

class SelectTextViewState extends State {
  String _dropDownValue;
  String initialUrl;
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[800],
          centerTitle: true,
          title: Text('Normal person', style: TextStyle(fontSize: 16)),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:
              DropdownButton(
                hint: _dropDownValue == null
                    ? Text('Select word')
                    : Text(
                  _dropDownValue,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.black),
                items: [
                  'ආයුබෝවන්',
                  'අට',
                  'හොඳයි',
                  'ඔහුගේ',
                  'ගෙදර',
                  'මම ඔයාට ආදරෙයි',
                  'නරකයි',
                  'ම්',
                  'ඔබ'
                ].map(
                      (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(
                        val,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                        () {
                      _dropDownValue = val;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.amber[800],
              onPressed: () {
                setState(() {
                  controller.loadUrl(WORD_LIST[_dropDownValue.toLowerCase()]);
                });
              },
              child: Text(
                'View 3D model',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
                height: height - 210,
                width: width,
                child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: "",
                    onWebViewCreated: (WebViewController webViewController) {
                      controller = webViewController;
                    })),
          ],
        ));
  }
}