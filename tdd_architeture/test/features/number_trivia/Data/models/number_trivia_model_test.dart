import 'dart:convert';
import 'package:clean_architeture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/Fixture_reader.dart';


void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

    test(
      'should be a subclass of NumberTrivia Entity',
      () async {

        expect(tNumberTriviaModel, isA<NumberTrivia>());


      },
    );

    group('fromJson', () {
 
       test(
    'should return a valid model when the JSON number is regarded as a double',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // assert
      expect(result, tNumberTriviaModel);
    },
  );
});
}