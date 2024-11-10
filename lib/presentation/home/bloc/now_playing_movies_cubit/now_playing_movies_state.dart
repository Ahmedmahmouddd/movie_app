part of 'now_playing_movies_cubit.dart';

@immutable
sealed class NowPlayingMoviesState {}

final class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

final class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

final class NowPlayingMoviesSuccess extends NowPlayingMoviesState {
  final List<MovieEntity> movies;

  NowPlayingMoviesSuccess({required this.movies});
}

final class NowPlayingMoviesFailure extends NowPlayingMoviesState {
  final String errorMessage;

  NowPlayingMoviesFailure({required this.errorMessage});
}
