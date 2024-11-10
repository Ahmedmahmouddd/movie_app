import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/auth/models/signin_req_param.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

class SignInUseCase extends UseCase<Either, SigninReqParam> {
  @override
  Future<Either> call({SigninReqParam? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }
}
