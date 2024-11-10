part of 'similar_tv_cubit.dart';

@immutable
sealed class SimilarTvState {}

final class SimilarTvInitial extends SimilarTvState {}

final class SimilarTvLoading extends SimilarTvState {}

final class SimilarTvSuccess extends SimilarTvState {
  final List<TVEntity> tv;

  SimilarTvSuccess({required this.tv});
}

final class SimilarTvFailure extends SimilarTvState {
  final String errorMessage;

  SimilarTvFailure({required this.errorMessage});
}
