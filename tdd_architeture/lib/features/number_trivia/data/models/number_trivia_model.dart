import 'package:meta/meta.dart';

import '../../domain/entities/number_trivia.dart';

 class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super( text: text,number: number,);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
  return NumberTriviaModel(
    text: json['text'],
    // The 'num' type can be both a 'double' and an 'int'
    number: (json['number'] as num).toInt(),
  );

  }

  Object toJson() {}
}