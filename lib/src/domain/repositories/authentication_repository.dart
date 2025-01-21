import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/domain/entity/authentication/authentication_credential.dart';

abstract class AuthenticationRepository {
  Future<DataState> login(String email);

  Future<DataState<AuthenticationCredential>> verifyOTP(
    String email,
    String otp,
  );

  Future<void> saveToken(String token);

  Future<String> getToken();

  Future<void> deleteToken();

}
