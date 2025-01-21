part of 'otp_bloc.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class ShowLoadingState extends OtpState {}

class HideLoadingState extends OtpState {}

class VerifyOTPSuccessState extends OtpState {}

class VerifyOTPErrorState extends OtpState {
  final String message;

  const VerifyOTPErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
