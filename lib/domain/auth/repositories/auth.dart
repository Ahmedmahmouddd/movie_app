import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signin_req_param.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupReqParam params);
  Future<Either> signIn(SigninReqParam params);
  Future<bool> isLoggedIn();
}
