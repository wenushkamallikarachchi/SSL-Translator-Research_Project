part of 'select_text_bloc.dart';

abstract class SelectTextEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetModelViewEvent extends SelectTextEvent {
  final String selectedWord;

  GetModelViewEvent({@required this.selectedWord});

  @override
  List<Object> get props => [selectedWord];
}
