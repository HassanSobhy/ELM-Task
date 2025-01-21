import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elm_task/src/di/injector.dart';
import 'package:elm_task/src/domain/usecases/authentication/get_token_use_case.dart';
import 'package:flutter/material.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await injector<GetTokenUseCase>()();
    options.headers['Authorization'] = 'Bearer $token';
    debugPrint(
        "REQUEST [${options.method}] URL: ${options.baseUrl + options.path}}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        "RESPONSE [${response.statusCode}]\n${jsonEncode(response.data)}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint(
        "ERROR [${err.response?.statusCode}] error message => ${err.response.toString()} error header => ${err.response?.headers.toString()}" );
    return super.onError(err, handler);

  }

}
