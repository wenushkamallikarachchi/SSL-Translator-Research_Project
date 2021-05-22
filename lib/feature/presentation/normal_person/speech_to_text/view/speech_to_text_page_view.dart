import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tflite_example/feature/presentation/normal_person/speech_to_text/bloc/speech_to_text_bloc.dart';
import 'package:tflite_example/feature/presentation/normal_person/speech_to_text/view/model_view.dart';

class SpeechToTextPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[800],
          centerTitle: true,
          title: Text(
            'Speech to Sign translation',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: BlocProvider<SpeechToTextBloc>(
          create: (context) => SpeechToTextBloc(),
          lazy: false,
          child: BlocBuilder<SpeechToTextBloc, SpeechToTextState>(
              builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  AvatarGlow(
                      glowColor: Color(0xcfcdca),
                      animate:
                          context.watch<SpeechToTextBloc>().state.listening,
                      endRadius: 80,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: IconButton(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          iconSize: 90,
                          icon: Icon(
                            Icons.mic,
                          ),
                          onPressed: () {
                            context
                                .read<SpeechToTextBloc>()
                                .add(SpeechStartEvent());
                          },
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  context.watch<SpeechToTextBloc>().state.word != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Captured Text: "+ ""+  context.read<SpeechToTextBloc>().state.word)
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ///start again
                      FlatButton(
                        minWidth: 100,
                        color: Colors.amber[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          context
                              .read<SpeechToTextBloc>()
                              .add(SpeechStartEvent());
                        },
                      ),
                      FlatButton(
                        minWidth: 100,
                        color: Colors.amber[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Text(
                          'View Model',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (state.word != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ModelView(keyValue: state.word)));
                          }
                        },
                      ),

                      ///view the model
                    ],
                  )
                ],
              ),
            );
          }),
        ));
  }
}
