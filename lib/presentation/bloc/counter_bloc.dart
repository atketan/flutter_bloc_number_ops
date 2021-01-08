import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_number_ops/presentation/bloc/counter_event.dart';
import 'package:flutter_bloc_number_ops/presentation/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  num _counter = 0;

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is SetupEvent) {
      _counter = event.value;
      yield InitialState(_counter);
    } else if (event is IncrementEvent) {
      _counter += event.value;
      yield IncrementState(_counter);
    } else if (event is DecrementEvent) {
      _counter -= event.value;
      yield DecrementState(_counter);
    } else if (event is MultiplicationEvent) {
      _counter *= event.value;
      yield MultipliedState(_counter);
    } else if (event is DivisionEvent) {
      _counter /= event.value;
      yield DividedState(_counter);
    }
  }
}
