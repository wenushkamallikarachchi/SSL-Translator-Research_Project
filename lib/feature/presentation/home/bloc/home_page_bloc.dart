import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is DeafPersonEvent) {
      yield DeafPersonState();
    } else if (event is NormalPersonEvent) {
      yield NormalPersonState();
    } else {
      yield HomePageError();
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
