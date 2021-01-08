abstract class CounterEvent {
  CounterEvent(this.value);

  num value;

  factory CounterEvent.setup(num value) => SetupEvent(value);

  factory CounterEvent.add(num value) => IncrementEvent(value);

  factory CounterEvent.subtract(num value) => DecrementEvent(value);

  factory CounterEvent.multiply(num value) => MultiplicationEvent(value);
}

class MultiplicationEvent extends CounterEvent {
  MultiplicationEvent(num value) : super(value);
}

class DecrementEvent extends CounterEvent {
  DecrementEvent(num value) : super(value);
}

class IncrementEvent extends CounterEvent {
  IncrementEvent(num value) : super(value);
}

class SetupEvent extends CounterEvent {
  SetupEvent(num value) : super(value);
}

class DivisionEvent extends CounterEvent {
  DivisionEvent(num value) : super(value);
}
