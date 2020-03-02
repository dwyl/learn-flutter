import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;


  NumberTrivia({
    @required this.text,
    @required this.number,
  });

  @override
  // TODO: implement props
  List<Object> get props => null;

}


