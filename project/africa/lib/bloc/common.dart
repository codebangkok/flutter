abstract class MyEvent {}

abstract class MyState {}

class StateUnInitialized extends MyState {
  @override
  String toString() => 'UnInitialized';
}

class StateLoading extends MyState {
  final String title;
  StateLoading({required this.title});

  @override
  String toString() => '$title Loading...';
}

class StateError extends MyState {
  final String message;
  StateError({required this.message});

  @override
  String toString() => 'Error: $message';
}
