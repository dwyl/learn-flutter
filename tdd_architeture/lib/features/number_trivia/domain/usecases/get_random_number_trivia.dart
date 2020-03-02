import 'package:clean_architeture_tdd/core/error/failures.dart';
import 'package:clean_architeture_tdd/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/number_trivia_repository.dart'; 

class GetRandomNumberTrivia extends UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;



  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}

class NoParams implements Equatable {
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  // TODO: implement stringify
  bool get stringify => null;
}