import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getMovieRecommendations(int movieId);
  Future<Either> getMovieSimilars(int movieId);
  Future<Either> searchMovies(String query);
}

class MovieServiceImpl implements MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
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
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.nowPlayingMovies);
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
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.movie}$movieId/trailer');
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
  Future<Either> getMovieRecommendations(int movieId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.movie}$movieId/recommendations');
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
  Future<Either> getMovieSimilars(int movieId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.movie}$movieId/similar');
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
  Future<Either> searchMovies(String query) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.searchMovie}/$query');
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
