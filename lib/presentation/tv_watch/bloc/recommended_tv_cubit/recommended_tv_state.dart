part of 'recommended_tv_cubit.dart';

@immutable
sealed class RecommendedTvState {}

final class RecommendedTvInitial extends RecommendedTvState {}

final class RecommendedTvLoading extends RecommendedTvState {}

final class RecommendedTvSuccess extends RecommendedTvState {
  final List<TVEntity> tv;

  RecommendedTvSuccess({required this.tv});
}

final class RecommendedTvFailure extends RecommendedTvState {
  final String errorMessage;

  RecommendedTvFailure({required this.errorMessage});
}
