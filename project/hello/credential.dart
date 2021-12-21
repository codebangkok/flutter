class Credential {
  final String email;
  final String password;
  const Credential({this.email = '', this.password = ''});

  Credential copyWith({String? email, String? password}) {
    return Credential(
        email: email ?? this.email, password: password ?? this.password);
  }
}

void main() {
  const cred = Credential();
  final update1 = cred.copyWith(email: 'surasuk612@gmail.com');
  final update2 = update1.copyWith(password: '123');
  final update3 = Credential().copyWith(email: 'bond@code.com');
}
