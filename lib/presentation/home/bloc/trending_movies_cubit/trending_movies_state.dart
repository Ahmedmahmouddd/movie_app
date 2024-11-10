part of 'trending_movies_cubit.dart';

@immutable
sealed class TrendingMoviesState {}

final class TrendingMoviesInitial extends TrendingMoviesState {}

final class TrendingMoviesLoading extends TrendingMoviesState {}

final class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<MovieEntity> movies;

  TrendingMoviesSuccess({required this.movies});
}

final class TrendingMoviesFailure extends TrendingMoviesState {
  final String errorMessage;

  TrendingMoviesFailure({required this.errorMessage});
}
