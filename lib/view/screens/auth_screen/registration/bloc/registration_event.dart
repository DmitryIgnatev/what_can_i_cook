part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends RegistrationEvent {
  final String email;

  const EmailChangedEvent({required this.email});
}

class PasswordChangedEvent extends RegistrationEvent {
  final String password;

  const PasswordChangedEvent({required this.password});
}

class CheckPasswordChangedEvent extends RegistrationEvent {
  final String checkPassword;

  const CheckPasswordChangedEvent({required this.checkPassword});
}
