import 'package:dio/dio.dart';
import 'package:elm_task/src/data/sources/remote/elm/api_keys.dart';
import 'package:elm_task/src/data/sources/remote/elm/authentication/entity/remote_authentication_credential.dart';
import 'package:elm_task/src/data/sources/remote/elm/authentication/request/login_request.dart';
import 'package:elm_task/src/data/sources/remote/elm/authentication/request/verify_otp_request.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_api_service.g.dart';

@RestApi()
abstract class AuthenticationAPIService {
  factory AuthenticationAPIService(Dio dio) = _AuthenticationAPIService;

  @POST(APIKeys.login)
  Future<HttpResponse> login(
    @Body() LoginRequest request,
  );

  @POST(APIKeys.verifyOTP)
  Future<HttpResponse<RemoteAuthenticationCredential>> verifyOTP(
      @Body() VerifyOTPRequest request,
      );



}
