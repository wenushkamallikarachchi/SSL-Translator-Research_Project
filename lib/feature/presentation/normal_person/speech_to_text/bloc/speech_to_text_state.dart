part of 'speech_to_text_bloc.dart';

abstract class SpeechToTextState extends Equatable {
  final bool listening;
  final bool available;
  final String word;
  SpeechToTextState(
      {@required this.listening, @required this.available, this.word});

  @override
  List<Object> get props => [listening];
}

class SpeechInitializedState extends SpeechToTextState {
  SpeechInitializedState() : super(available: false, listening: false);
}

class ChangeListeningState extends SpeechToTextState {
  final bool listening;

  ChangeListeningState({@required this.listening})
      : super(available: false, listening: listening);

  @override
  List<Object> get props => [listening];
}

class SpeechEndedState extends SpeechToTextState {
  SpeechEndedState() : super(available: false, listening: false);
}

class SpeechGotState extends SpeechToTextState {
  final String text;
  final bool listening;
  SpeechGotState({@required this.text, @required this.listening})
      : super(available: true, listening: listening, word: text);
}

class SpeechToTextPageInitial extends SpeechToTextState {
  SpeechToTextPageInitial() : super(available: false, listening: false);
}

class SpeechToTextPageError extends SpeechToTextState {}
