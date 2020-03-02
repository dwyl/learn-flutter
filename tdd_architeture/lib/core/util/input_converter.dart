import 'package:clean_architeture_tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    // TODO: Implement
  }
}

abstract class InvalidInputFailure extends Failure{}