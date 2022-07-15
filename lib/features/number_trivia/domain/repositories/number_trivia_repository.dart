import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_clean_architeture/core/error/failure.dart';
import 'package:flutter_tdd_clean_architeture/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
