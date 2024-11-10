import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_app/core/models/trailer.dart';
import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/data/movie/sources/movie_service.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var data = await sl<MovieService>().getTrendingMovies();
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var data = await sl<MovieService>().getNowPlayingMovies();
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var data = await sl<MovieService>().getMovieTrailer(movieId);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        var trailer = TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
        return Right(trailer);
      },
    );
  }

  @override
  Future<Either> getRecommendedMovies(int movieId) async {
    var data = await sl<MovieService>().getMovieRecommendations(movieId);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var data = await sl<MovieService>().getMovieSimilars(movieId);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> searchMovies(String query) async {
    var data = await sl<MovieService>().searchMovies(query);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }
}
