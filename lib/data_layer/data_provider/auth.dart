import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:marlo/data_layer/model/error_model/error.dart';
import 'package:marlo/presentation/const/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUser {
  Future<Either<ErrorModel, String>> loginUser() async {
    SharedPreferences shrd = await SharedPreferences.getInstance();
    Map<String, dynamic> userDetailes = {
      "email": "geethumahi38+2@gmail.com",
      "password": "Marlo@123",
      "returnSecureToken": true
    };
    Dio dio = Dio();
    try {
      Response response = await dio.post(baseUrl, data: jsonEncode(userDetailes));
      final access = response.data['idToken'];
      final refresh = response.data['refreshToken'];
      shrd.setString('access', access);
      shrd.setString('refresh', refresh);
      return Right(access);
    } on DioException catch (e) {
      return Left(ErrorModel(error: e.error.toString()));
    }
  }
}
