import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterState {
  final int value;
  CounterState({required this.value});

  @override
  String toString() => 'Value is $value';
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(value: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterState(value: state.value + 1);
        break;
      case CounterEvent.decrement:
        yield CounterState(value: state.value - 1);
        break;
    }
  }
}
