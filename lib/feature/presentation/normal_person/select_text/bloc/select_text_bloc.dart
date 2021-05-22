import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tflite_example/feature/domain/usecases/get_model_from_word.dart';

part 'select_text_event.dart';
part 'select_text_state.dart';

class SelectTextBloc extends Bloc<SelectTextEvent, SelectTextState> {
  SelectTextBloc({@required this.getModelLinkFromWord})
      : super(SelectTextInitial());

  final GetModelLinkFromWord getModelLinkFromWord;

  @override
  Stream<SelectTextState> mapEventToState(SelectTextEvent event) async* {
    if (event is GetModelViewEvent) {
      yield ModelLoadingState(event.selectedWord);
      var response = await getModelLinkFromWord(event.selectedWord);
      yield response.fold((failure) {
        print("----error----");
        return SelectTextError(event.selectedWord);
      }, (data) {
        return ModelLoadedState(link: data, selectedWord: event.selectedWord);
      });
    } else {
      yield SelectTextError(state.selectedWord);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
