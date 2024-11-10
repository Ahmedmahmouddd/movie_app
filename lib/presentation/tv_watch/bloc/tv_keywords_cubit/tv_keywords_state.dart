part of 'tv_keywords_cubit.dart';

@immutable
sealed class TvKeywordsState {}

final class TvKeywordsInitial extends TvKeywordsState {}

final class TvKeywordsLoading extends TvKeywordsState {}

final class TvKeywordsSuccess extends TvKeywordsState {
  final List<KeywordEntity> keywords;

  TvKeywordsSuccess({required this.keywords});
}

final class TvKeywordsFailure extends TvKeywordsState {
  final String errorMessage;
  TvKeywordsFailure({required this.errorMessage});
}
