import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signin_req_param.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/data/auth/sources/auth_service.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(SignupReqParam params) async {
    var data = await sl<AuthService>().signUp(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return right(data);
      },
    );
  }

  @override
  Future<Either> signIn(SigninReqParam params) async {
    var data = await sl<AuthService>().signIn(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    }
    return true;
  }
}
