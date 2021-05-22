part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeafPersonEvent extends HomePageEvent {}

class NormalPersonEvent extends HomePageEvent {}

class TransalateWordEvent extends HomePageEvent {}

class TransalateSentenceEvent extends HomePageEvent {}

class SpeechToTextEvent extends HomePageEvent {}

class SelectTextEvent extends HomePageEvent {}





