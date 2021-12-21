import 'bloc/gender_bloc.dart';

void main(List<String> arguments) {
  final genderBloc = GenderBloc();
  genderBloc.stream.listen(print);

  genderBloc.add(GenderGetEvent());

  genderBloc.close();
}
