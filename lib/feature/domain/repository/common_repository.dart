import 'package:dartz/dartz.dart';
import 'package:tflite_example/core/error/failure.dart';

abstract class CommonRepository {

  //provide web link accrding to each word
  Future<Either<Failure, String>> getWordWebLink(String category);

  //provide 
  //Future<Either<Failure, String>> searchTopHeadlinesNews(String keyword);
}