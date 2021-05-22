part of 'select_text_bloc.dart';

abstract class SelectTextState extends Equatable {
  final String selectedWord;

  SelectTextState({@required this.selectedWord});

  @override
  List<Object> get props => [selectedWord];
}

class ModelLoadingState extends SelectTextState {
  ModelLoadingState(String selectedWord):super(selectedWord: selectedWord);
}

class ModelLoadedState extends SelectTextState {
  final String link;

  ModelLoadedState({@required this.link,String selectedWord}):super(selectedWord: selectedWord);

  @override
  List<Object> get props => [link];
}

class ModelNotFoundState extends SelectTextState {
    ModelNotFoundState(String selectedWord):super(selectedWord: selectedWord);

}

class SelectTextInitial extends SelectTextState {}

class SelectTextError extends SelectTextState {
    SelectTextError(String selectedWord):super(selectedWord: selectedWord);

}
