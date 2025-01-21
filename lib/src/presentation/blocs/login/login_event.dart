part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ValidateEmailEvent extends LoginEvent {
  final String email;

  const ValidateEmailEvent({
    required this.email,
  });

  @override
  List<Object> get props => [
        email,
      ];
}

class LoginRequestEvent extends LoginEvent {
  final String email;

  const LoginRequestEvent({
    required this.email,
  });

  @override
  List<Object> get props => [
        email,
      ];
}
