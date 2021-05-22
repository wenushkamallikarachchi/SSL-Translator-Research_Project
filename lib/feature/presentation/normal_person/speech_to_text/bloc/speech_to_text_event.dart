part of 'speech_to_text_bloc.dart';

abstract class SpeechToTextEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SpeechStartEvent extends SpeechToTextEvent {}

class SpeechInitializeEvent extends SpeechToTextEvent {}

class ChangeListeningEvent extends SpeechToTextEvent {
  final bool listening;
  ChangeListeningEvent({@required this.listening});

  @override
  List<Object> get props => [listening];
}

class GotWordEvent extends SpeechToTextEvent {
  final bool listening;
  final String word;
  GotWordEvent({@required this.listening, @required this.word});

  @override
  List<Object> get props => [listening,word];
}
