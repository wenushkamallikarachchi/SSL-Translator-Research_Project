import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tflite_example/core/error/failure.dart';
import 'package:tflite_example/core/network/network_info.dart';
import 'package:tflite_example/feature/data/data_Source/local_datasource.dart';
import 'package:tflite_example/feature/domain/repository/common_repository.dart';

class CommonRepositoryImpl implements CommonRepository {
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CommonRepositoryImpl(
      {@required this.localDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, String>> getWordWebLink(String word) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        String response = localDataSource.wordMap[word];
        return Right(response);
      } catch (e) {
        return Left(ServerFailure(e));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
