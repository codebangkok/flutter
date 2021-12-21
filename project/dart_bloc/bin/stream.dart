import 'dart:io';

void main() {
  final boatStream = getBoatStream();

  boatStream.listen((value) {
    print('Received boat $value');
    print('------------------');
  });
}

Stream<int> getBoatStream() async* {
  for (var i = 1; i <= 5; i++) {
    stdout.write('Sent boat $i');
    stdin.readLineSync();
    yield i;
  }
}
