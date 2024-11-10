import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signin_req_param.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/service_locator.dart';

abstract class AuthService {
  Future<Either> signUp(SignupReqParam params);
  Future<Either> signIn(SigninReqParam params);
}

class AuthServiceImpl extends AuthService {
  @override
  Future<Either> signUp(SignupReqParam params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signIn(SigninReqParam params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
