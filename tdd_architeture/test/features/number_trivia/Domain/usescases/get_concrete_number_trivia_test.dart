import 'package:clean_architeture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';


class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main(){
  getConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp((){
  mockNumberTriviaRepository = MockNumberTriviaRepository();
  usecase = getConcreteNumberTrivia(mockNumberTriviaRepository);
  });

final tNumber = 1;
final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number for the repository',
  () async{
when (mockNumberTriviaRepository.getConcreteNumberTrivia(any))
.thenAnswer((_) async  => Right(tNumberTrivia));

  final result = await usecase(Params(number: tNumber));

      expect(result, Right(tNumberTrivia));

      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));

      verifyNoMoreInteractions(mockNumberTriviaRepository);  
  
  },
  );
}