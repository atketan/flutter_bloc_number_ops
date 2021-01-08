import 'package:flutter_bloc_number_ops/presentation/bloc/counter_event.dart';

abstract class CounterState {
  CounterState(this.result);

  num result;

  factory CounterState.initial() => InitialState(0);

  factory CounterState.added(num byValue) => IncrementState(byValue);
}

class IncrementState extends CounterState {
  IncrementState(num result) : super(result);
}

class InitialState extends CounterState {
  InitialState(num result) : super(result);
}

class DecrementState extends CounterState {
  DecrementState(num result) : super(result);
}

class MultipliedState extends CounterState {
  MultipliedState(num result) : super(result);
}

class DividedState extends CounterState {
  DividedState(num result) : super(result);
}

class NonChangeState extends CounterState {
  NonChangeState(num value) : super(value);
}
