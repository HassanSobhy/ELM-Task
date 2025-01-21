import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elm_task/src/core/resources/data_state.dart';
import 'package:elm_task/src/data/sources/local/secure_storage/authentication_secure_storage.dart';
import 'package:elm_task/src/data/sources/remote/elm/authentication/authentication_api_service.dart';
import 'package:elm_task/src/data/sources/remote/elm/authentication/entity/remote_authentication_credential.dart';
import 'package:elm_task/src/data/sources/remote/elm/authentication/request/login_request.dart';
import 'package:elm_task/src/data/sources/remote/elm/authentication/request/verify_otp_request.dart';
import 'package:elm_task/src/domain/entity/authentication/authentication_credential.dart';
import 'package:elm_task/src/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final AuthenticationAPIService _authenticationAPIService;
  final AuthenticationSecureStorage _authenticationSecureStorage;

  AuthenticationRepositoryImplementation(
    this._authenticationAPIService,
    this._authenticationSecureStorage,
  );

  @override
  Future<DataState> login(String email) async {
    try {
      final httpResponse = await _authenticationAPIService.login(
        LoginRequest(
          email: email,
        ),
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: "Success");
      }

      return DataFailed(message: "Something went wrong");
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }

  @override
  Future<DataState<AuthenticationCredential>> verifyOTP(
      String email, String otp) async {
    try {
      final httpResponse = await _authenticationAPIService.verifyOTP(
        VerifyOTPRequest(
          email: email,
          otp: otp,
        ),
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: httpResponse.data.mapToDomain(),
        );
      }

      return DataFailed(message: "Something went wrong");
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }

  @override
  Future<void> saveToken(String token) async{
    return await _authenticationSecureStorage.saveToken(token);
  }

  @override
  Future<String> getToken() async {
    return await _authenticationSecureStorage.getToken();
  }

  @override
  Future<void> deleteToken() async{
    return await _authenticationSecureStorage.deleteToken();
  }


}
