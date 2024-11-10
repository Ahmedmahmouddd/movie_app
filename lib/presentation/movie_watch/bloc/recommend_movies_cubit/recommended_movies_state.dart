part of 'recommended_movies_cubit.dart';

@immutable
sealed class RecommendedMoviesState {}

final class RecommendedMoviesInitial extends RecommendedMoviesState {}

final class RecommendedMoviesLoading extends RecommendedMoviesState {}

final class RecommendedMoviesSuccess extends RecommendedMoviesState {
  final List<MovieEntity> movies;

  RecommendedMoviesSuccess({required this.movies});
}

final class RecommendedMoviesFailure extends RecommendedMoviesState {
  final String errorMessage;

  RecommendedMoviesFailure({required this.errorMessage});
}
