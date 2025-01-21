import 'dart:async';

import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/usecases/authentication/login_use_case.dart';
import 'package:elm_task/src/domain/usecases/authentication/validate_email_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ValidateEmailUseCase _validateEmailUseCase;
  final LoginUseCase _loginUseCase;

  LoginBloc(
    this._validateEmailUseCase,
    this._loginUseCase,
  ) : super(LoginInitial()) {
    on<ValidateEmailEvent>(_onValidateEmailEvent);
    on<LoginRequestEvent>(_onLoginRequestEvent);
  }

  void _onValidateEmailEvent(
      ValidateEmailEvent event, Emitter<LoginState> emit) {
    EmailValidatorState isValid = _validateEmailUseCase(event.email);
    if (isValid == EmailValidatorState.EmptyEmail) {
      emit(InValidEmailState(
        message: 'Email is empty',
      ));
    } else if (isValid == EmailValidatorState.InvalidEmail) {
      emit(InValidEmailState(
        message: 'Email is invalid',
      ));
    } else {
      emit(ValidEmailState());
    }
  }

  Future<void> _onLoginRequestEvent(
      LoginRequestEvent event, Emitter<LoginState> emit) async {
    emit(ShowLoadingState());
    final result = await _loginUseCase(
      event.email,
    );
    if (result is DataSuccess) {
      emit(LoginSuccessState(
        email: event.email,
      ));
    } else {
      emit(LoginErrorState(
        message: result.message ?? "",
      ));
    }
    emit(HideLoadingState());
  }
}
