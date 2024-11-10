part of 'movie_similars_cubit.dart';

@immutable
sealed class SimilarMoviesState {}

final class MovieSimilarsInitial extends SimilarMoviesState {}

final class SimilarMoviesLoading extends SimilarMoviesState {}

final class SimilarMoviesSuccess extends SimilarMoviesState {
  final List<MovieEntity> movies;
  SimilarMoviesSuccess({required this.movies});
}

final class SimilarMoviesFailure extends SimilarMoviesState {
  final String errorMessage;
  SimilarMoviesFailure({required this.errorMessage});
}
