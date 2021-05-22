import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tflite_example/core/interceptors/dio_interceptor.dart';
import 'package:tflite_example/core/network/network_info.dart';
import 'package:tflite_example/feature/data/data_Source/local_datasource.dart';
import 'package:tflite_example/feature/data/repository/common_repository_impl.dart';
import 'package:tflite_example/feature/domain/repository/common_repository.dart';
import 'package:tflite_example/feature/domain/usecases/get_model_from_word.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///dio
  sl.registerLazySingleton(() {
    final dio = Dio();
    dio.options.baseUrl = "";
    dio.interceptors.add(DioInterceptor());
    return dio;
  });

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///data source
  sl.registerLazySingleton(() => LocalDataSource());

  sl.registerLazySingleton<CommonRepository>(
      () => CommonRepositoryImpl(localDataSource: sl(), networkInfo: sl()));

  ///use case
  sl.registerLazySingleton(() => GetModelLinkFromWord(commonRepository: sl()));

  sl.registerLazySingleton(() => DataConnectionChecker());
}
