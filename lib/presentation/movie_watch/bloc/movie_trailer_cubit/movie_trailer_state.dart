part of 'movie_trailer_cubit.dart';

@immutable
sealed class MovieTrailerState {}

final class MovieTrailerInitial extends MovieTrailerState {}

final class MovieTrailerLoading extends MovieTrailerState {}

final class MovieTrailerSuccess extends MovieTrailerState {
final YoutubePlayerController youtubePlayerController;
  MovieTrailerSuccess({required this.youtubePlayerController});
}

final class MovieTrailerFailure extends MovieTrailerState {
  final String errorMessage;

  MovieTrailerFailure({required this.errorMessage});
}
