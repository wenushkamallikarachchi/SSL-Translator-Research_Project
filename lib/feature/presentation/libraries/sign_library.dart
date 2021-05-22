import 'package:flutter/material.dart';

class SignLibraryView extends StatefulWidget {
  @override
  SignLibraryState createState() => SignLibraryState();
}

class SignLibraryState extends State {
  Widget build(BuildContext context) {
    final signAndCaption = [
      ["assets/signs/1.jpg", "ආයුබෝවන්"],
      ["assets/signs/2.jpeg", "අට"],
      ["assets/signs/3.jpg", "හොඳයි"],
      ["assets/signs/4.jpg", "ඔහුගේ"],
      ["assets/signs/6.jpg", "ILoveYou"],
      ["assets/signs/5.jpg", "ගෙදර"],
      ["assets/signs/7.jpg", "නරකයි"],
      ["assets/signs/8.jpg", "ඔබ"],
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        centerTitle: true,
        title: Text('Sign Library', style: TextStyle(fontSize: 16)),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children: signAndCaption
              .map(
                (i) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      elevation: 3.0,
                      child: Image.asset(
                        i.first,
                        height: 100,
                        width: 150,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 50,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          i.last,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList()),
    );
  }
}
