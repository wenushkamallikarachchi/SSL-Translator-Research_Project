import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tflite_example/feature/presentation/deaf_person/sentence_classification_view.dart';
import 'package:tflite_example/feature/presentation/deaf_person/word_classification_view.dart';
import 'package:tflite_example/feature/presentation/home/bloc/home_page_bloc.dart';
import 'package:tflite_example/feature/presentation/libraries/sign_library.dart';
import 'package:tflite_example/feature/presentation/libraries/voice_library.dart';
import 'package:tflite_example/feature/presentation/normal_person/select_text/select_text_view.dart';
import 'package:tflite_example/feature/presentation/normal_person/speech_to_text/view/speech_to_text_page_view.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          drawer: new Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Menu',style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/slide/Sign6.png'),
                      fit: BoxFit.fill,
                    ),

                    //color: Colors.amber[800],
                  ),
                ),
                ListTile(
                  title: Text('Voice Library'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VoiceLibraryView()));
                    // Then close the drawer
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Sign Library'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignLibraryView()));
                  },
                ),
              ],
            ),
          ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("SSL Translator"),
        backgroundColor: Colors.amber[800],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),

          ///carousal slider
          CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.asset("assets/slide/Slide2.PNG"),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.asset("assets/slide/slideHero1.png"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.asset("assets/slide/slideHero2.png"),
              )
            ],
            options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlay: true,
                enlargeCenterPage: false),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.amber[800],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                "Select Person Type :",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18.0),
                    image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.orange, BlendMode.color),
                        fit: BoxFit.fill,
                        image: AssetImage("assets/slide/Slide8.PNG"))),
                width: 100,
                child: FlatButton(
                  minWidth: 100,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  child: Text(
                    'Deaf',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    context.read<HomePageBloc>().add(DeafPersonEvent());
                  },
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18.0),
                    image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.orange, BlendMode.color),
                        fit: BoxFit.fill,
                        image: AssetImage("assets/slide/Slide4.PNG"))),
                width: 100,
                child: FlatButton(
                  minWidth: 100,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  child: Text(
                    'Normal',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    context.read<HomePageBloc>().add(NormalPersonEvent());
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),

          ///bloc builder
          BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
            if (state is DeafPersonState) {
              return Column(
                children: [
                  ListTile(
                    title: Text("Transalate"),
                  ),
                  ListTile(
                    leading: Text("Word"),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WordClassificationView()));
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text("Sentence"),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SentenceClassificationView()));
                      },
                    ),
                  ),
                ],
              );
            } else if (state is NormalPersonState) {
              return Column(
                children: [
                  ListTile(
                    title: Text("Expectation"),
                  ),
                  ListTile(
                    leading: Text("Voice To Sign"),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SpeechToTextPageView()));
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text("Text To Sign"),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectTextView()));
                      },
                    ),
                  ),
                ],
              );
            }
            return Container();
          })
        ],
      ),
    ));
  }
}
