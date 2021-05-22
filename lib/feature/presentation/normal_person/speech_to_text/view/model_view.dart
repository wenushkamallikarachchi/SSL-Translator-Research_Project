import 'package:tflite_example/feature/data/data_Source/local_datasource.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class ModelView extends StatelessWidget {
  
  final wordList = LocalDataSource().wordMap;

  final keyValue;

  ModelView({Key key, @required this.keyValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url = wordList[keyValue.toLowerCase()];
    print(url);
    if (keyValue != null && url != null) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber[800],
            centerTitle: true,
            title: Text(
              '3D Model Viewer',
              style: TextStyle(fontSize: 16),
            ),
          ),
          body: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text(
            'Model is not available',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }
  }
}
