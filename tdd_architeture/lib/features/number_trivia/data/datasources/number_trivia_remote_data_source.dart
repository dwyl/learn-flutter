import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clean_architeture_tdd/core/error/exceptions.dart';
import 'package:clean_architeture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

abstract class NumberTriviaRemoteDataSource{
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
  
}
class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});

@override
Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
    _getTriviaFromUrl('http://numbersapi.com/$number');

@override
Future<NumberTriviaModel> getRandomNumberTrivia() =>
    _getTriviaFromUrl('http://numbersapi.com/random');

Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
  final response = await client.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return NumberTriviaModel.fromJson(json.decode(response.body));
  } else {
    throw ServerException();
  }
}
}