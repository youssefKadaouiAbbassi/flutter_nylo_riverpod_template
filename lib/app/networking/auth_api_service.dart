import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/access_token.dart';
import 'package:flutter_app/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../models/user.dart';
import 'dio/interceptors/bearer_auth_interceptor.dart';
import 'dio/interceptors/logging_interceptor.dart';

class AuthApiService extends BaseApiService {
  AuthApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  final interceptors = {
    BearerAuthInterceptor: BearerAuthInterceptor(),
    LoggingInterceptor: LoggingInterceptor()
  };

  Future<AccessToken?> signIn(
      {required String email, required String password}) async {
    return await network<AccessToken>(
      request: (request) => request
          .put("/auth/signIn", data: {'email': email, 'password': password}),
    );
  }

  Future<AccessToken?> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    return await network<AccessToken>(
      request: (request) => request.post("/auth/signUp", data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName
      }),
    );
  }

  Future<User?> getUser() async {
    return await network<User>(
      request: (request) {
        return request.get("/auth/user");
      },
    );
  }
}
