import 'package:clean_architeture_tdd/core/error/failures.dart';
import 'package:clean_architeture_tdd/core/usecases/usecase.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class getConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  getConcreteNumberTrivia(this.repository);


@override
Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }

}


class Params extends Equatable{
  final int number;

  Params({@required this.number});

  @override
  // TODO: implement props
  List<Object> get props => null;


}

