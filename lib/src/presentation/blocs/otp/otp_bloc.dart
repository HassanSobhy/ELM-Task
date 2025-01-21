import 'dart:async';

import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/authentication/authentication_credential.dart';
import 'package:elm_task/src/domain/usecases/authentication/save_token_use_case.dart';
import 'package:elm_task/src/domain/usecases/authentication/verify_otp_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final VerifyOTPUseCase _verifyOTPUseCase;
  final SaveTokenUseCase _saveTokenUseCase;

  OtpBloc(
    this._verifyOTPUseCase,
    this._saveTokenUseCase,
  ) : super(OtpInitial()) {
    on<VerifyOtpEvent>(_onOtpVerifyEvent);
  }

  Future<void> _onOtpVerifyEvent(
      VerifyOtpEvent event, Emitter<OtpState> emit) async {
    emit(ShowLoadingState());
    final DataState<AuthenticationCredential> result = await _verifyOTPUseCase(
      event.email,
      event.otp,
    );

    if (result is DataSuccess) {
      await _saveTokenUseCase(result.data?.token ?? "");
      emit(VerifyOTPSuccessState());
    } else {
      emit(
        VerifyOTPErrorState(
          message: result.message ?? "",
        ),
      );
    }

    emit(HideLoadingState());
  }
}
