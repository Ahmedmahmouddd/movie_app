import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class TVService {
  Future<Either> getPopulerTV();
  Future<Either> getTvTrailer(int tvId);
  Future<Either> getRecommendedTv(int tvId);
  Future<Either> getSimilarTv(int tvId);
  Future<Either> getTvKeywords(int tvId);
  Future<Either> searchTv(String query);
}

class TVServiceImpl extends TVService {
  @override
  Future<Either> getPopulerTV() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTV);
      return Right(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left('Error 404: Source not found.');
      } else {
        return Left(e.response!.data['message']);
      }
    }
  }

  @override
  Future<Either> getTvTrailer(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tv}$tvId/trailers');
      return Right(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left('Error 404: Source not found.');
      } else {
        return Left(e.response!.data['message']);
      }
    }
  }

  @override
  Future<Either> getRecommendedTv(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tv}$tvId/recommendations');
      return Right(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left('Error 404: Source not found.');
      } else {
        return Left(e.response!.data['message']);
      }
    }
  }

  @override
  Future<Either> getSimilarTv(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tv}$tvId/similar');
      return Right(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left('Error 404: Source not found.');
      } else {
        return Left(e.response!.data['message']);
      }
    }
  }

  @override
  Future<Either> getTvKeywords(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tv}$tvId/keywords');
      return Right(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left('Error 404: Source not found.');
      } else {
        return Left(e.response!.data['message']);
      }
    }
  }

  @override
  Future<Either> searchTv(String query) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.searchTv}/$query');
      return Right(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left('Error 404: Source not found.');
      } else {
        return Left(e.response!.data['message']);
      }
    }
  }
}
