abstract class Event {}

abstract class State {}

class StateUnInitialized extends State {
  @override
  String toString() => 'UnInitialized';
}

class StateLoading extends State {
  final String title;
  StateLoading({required this.title});

  @override
  String toString() => '$title Loading...';
}

class StateError extends State {
  final String message;
  StateError({required this.message});

  @override
  String toString() => 'Error: $message';
}
