part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final String email;
  final String password;
  final String checkPassword;

  const RegistrationState(
      {required this.email,
      required this.password,
      required this.checkPassword});

  factory RegistrationState.initial() =>
      const RegistrationState(email: "", password: "", checkPassword: "");

  RegistrationState copyWith(
      {String? email, String? password, String? checkPassword}) {
    return RegistrationState(
        email: email ?? this.email,
        password: password ?? this.password,
        checkPassword: checkPassword ?? this.checkPassword);
  }

  @override
  List<Object> get props => [email, password, checkPassword];
}
