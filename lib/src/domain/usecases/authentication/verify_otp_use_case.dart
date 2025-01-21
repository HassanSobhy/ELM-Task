import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/authentication/authentication_credential.dart';
import 'package:elm_task/src/domain/repositories/authentication_repository.dart';

class VerifyOTPUseCase {
  final AuthenticationRepository _repository;

  VerifyOTPUseCase(this._repository);

  Future<DataState<AuthenticationCredential>> call(
    String email,
    String otp,
  ) async {
    return await _repository.verifyOTP(
      email,
      otp,
    );
  }
}
