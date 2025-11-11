import 'package:equatable/equatable.dart';

abstract class CounterCubitState extends Equatable{
 const  CounterCubitState();
}


class CounterInitiate extends CounterCubitState{
  @override
  List<Object?> get props => [];
}


class CounterUpdatedValue extends CounterCubitState{
  final int counter;

  const CounterUpdatedValue({required this.counter});

  @override
  List<Object?> get props => [counter];

}



