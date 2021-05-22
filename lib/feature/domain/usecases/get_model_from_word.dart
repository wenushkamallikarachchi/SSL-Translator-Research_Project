import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tflite_example/core/error/failure.dart';
import 'package:tflite_example/core/usecase/usecase.dart';
import 'package:tflite_example/feature/domain/repository/common_repository.dart';

class GetModelLinkFromWord implements UseCase<String, String> {
  final CommonRepository commonRepository;
  GetModelLinkFromWord({@required this.commonRepository});

  @override
  Future<Either<Failure, String>> call(String params) async {
    return await commonRepository.getWordWebLink(params);
  }
}
