import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState.initial()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<CheckPasswordChangedEvent>(_onCheckPasswordChanged);
  }
  void _onEmailChanged(
      EmailChangedEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
      PasswordChangedEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onCheckPasswordChanged(
      CheckPasswordChangedEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(checkPassword: event.checkPassword));
  }
}
