import 'package:flutter/material.dart';

class VoiceLibraryView extends StatefulWidget {
  @override
  VoiceLibraryState createState() => VoiceLibraryState();
}

class VoiceLibraryState extends State {
  Widget build(BuildContext context) {
    final voiceList = [
      ["Welcome"],
      ["Good"],
      ["Home"],
      ["I Love You"],
      ["Eight"],
      ["Bad"],
      ["His"],
      ["You"]
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        centerTitle: true,
        title: Text('Voice Library', style: TextStyle(fontSize: 16)),
      ),
      body: GridView.count(
          crossAxisCount: 3,
          children: voiceList
              .map(
                (i) => Column(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        i.last,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
              .toList()),
    );
  }
}
