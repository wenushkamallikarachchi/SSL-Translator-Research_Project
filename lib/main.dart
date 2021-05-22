import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tflite_example/feature/domain/usecases/get_model_from_word.dart';
import 'package:tflite_example/feature/presentation/home/bloc/home_page_bloc.dart';
import 'package:tflite_example/feature/presentation/normal_person/select_text/bloc/select_text_bloc.dart';
import 'package:tflite_example/feature/presentation/splash.dart';

import 'core/injection/injection_container.dart' as di;
import 'core/injection/injection_container.dart';
//import 'feature/presentation/home/view/home_screen.dart';

void main() async {
  ///create singleton classes
  await di.init();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomePageBloc>(
            create: (context) => HomePageBloc(),
            lazy: false,
          ),
          BlocProvider<SelectTextBloc>(
            create: (context) => SelectTextBloc(
                getModelLinkFromWord: sl<GetModelLinkFromWord>()),
            lazy: false,
          )
        ],
        child: MaterialApp(
          title: 'SSL Transalator',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Color(0xFF761322),
          ),
        ));
  }
}
