import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendedMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> searchMovies(String query);
}
