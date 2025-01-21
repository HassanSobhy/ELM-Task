part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class ShowLoadingState extends LoginState {}

class HideLoadingState extends LoginState {}

class InValidEmailState extends LoginState {
  final String message;

  const InValidEmailState({
    required this.message,
  });

  @override
  List<Object> get props => [
    message,
  ];
}

class ValidEmailState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String email;

  const LoginSuccessState({
    required this.email,
  });

}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

// class LoginErrorMessageState extends LoginState {
//   final String errorMessage;
//
//   LoginErrorMessageState({required this.errorMessage});
// }

// class LoginEmailValidState extends LoginState {}
//
// class LoginEmailNotValidState extends LoginState {
//   final String message;
//
//   LoginEmailNotValidState({
//     required this.message,
//   });
// }
//
