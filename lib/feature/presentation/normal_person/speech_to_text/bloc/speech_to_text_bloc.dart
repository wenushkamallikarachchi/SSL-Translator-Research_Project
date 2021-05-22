import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

part 'speech_to_text_event.dart';
part 'speech_to_text_state.dart';

class SpeechToTextBloc extends Bloc<SpeechToTextEvent, SpeechToTextState> {
  SpeechToTextBloc() : super(SpeechToTextPageInitial()) {
    add(SpeechInitializeEvent());
  }

  stt.SpeechToText _speech;

  @override
  Stream<SpeechToTextState> mapEventToState(SpeechToTextEvent event) async* {
    // else if (event is NormalPersonEvent) {
    //   yield NormalPersonState();
    // }
    if (event is SpeechInitializeEvent) {
      if (_speech == null) {
        _speech = stt.SpeechToText();
      }
      yield SpeechInitializedState();
    } else if (event is ChangeListeningEvent) {
      yield ChangeListeningState(listening: !state.listening);
    } else if (event is GotWordEvent) {
      yield SpeechGotState(listening: event.listening, text: event.word);
    } else if (event is SpeechStartEvent) {
      if (state.listening) {
        add(ChangeListeningEvent(listening: !state.listening));
      }

      if (!state.listening) {
        bool available = await _speech.initialize(
            onStatus: (val) => print('onStatus: $val'),
            onError: (val) => print('onError: $val'));

        if (available) {
          add(ChangeListeningEvent(listening: !state.listening));

          _speech.listen(onResult: (val) {
            String outputText =
                "Captured Voice into Text: " + val.recognizedWords;
            print("--------" + outputText + "--------");
            if (val.recognizedWords.isNotEmpty) {
              add(GotWordEvent(
                  word: val.recognizedWords, listening: !state.listening));
              //add(ChangeListeningEvent(listening: !state.listening));

            }
          });
        } else {
          add(ChangeListeningEvent(listening: !state.listening));
          _speech.stop();
        }
      }
    } else {
      yield SpeechToTextPageError();
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
