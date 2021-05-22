part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class DeafPersonState extends HomePageState {}

class NormalPersonState extends HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageError extends HomePageState {}

