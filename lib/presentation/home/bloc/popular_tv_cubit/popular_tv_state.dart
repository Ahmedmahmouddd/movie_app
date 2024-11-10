part of 'popular_tv_cubit.dart';

@immutable
sealed class PopularTVState {}

final class PopularTVInitial extends PopularTVState {}

final class PopularTVLoading extends PopularTVState {}

final class PopularTVSuccess extends PopularTVState {
  final List<TVEntity> tv;

  PopularTVSuccess({required this.tv});
}

final class PopularTVFailure extends PopularTVState {
  final String errorMessage;

  PopularTVFailure({required this.errorMessage});
}

