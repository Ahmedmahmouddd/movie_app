part of 'tv_trailer_cubit.dart';

@immutable
sealed class TvTrailerState {}

final class TvTrailerInitial extends TvTrailerState {}
final class TvTrailerLoading extends TvTrailerState {}

final class TvTrailerSuccess extends TvTrailerState {
final YoutubePlayerController youtubePlayerController;
  TvTrailerSuccess({required this.youtubePlayerController});
}

final class TvTrailerFailure extends TvTrailerState {
  final String errorMessage;

  TvTrailerFailure({required this.errorMessage});
}
