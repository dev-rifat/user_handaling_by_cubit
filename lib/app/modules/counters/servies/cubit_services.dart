import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_state.dart';

class CounterServiceCubit extends Cubit<CounterCubitState> {
  int counter = 0;
  CounterServiceCubit() : super(CounterInitiate());

  void counterIncrement() {
    counter++;
    emit(CounterUpdatedValue(counter: counter));
  }

  void counterDecrement() {
    counter--;
    emit(CounterUpdatedValue(counter: counter));
  }
}
