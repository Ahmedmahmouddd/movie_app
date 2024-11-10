part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchMoviesSuccess extends SearchState {
  final List<MovieEntity> movies;
  SearchMoviesSuccess({required this.movies});
}

final class SearchTvSuccess extends SearchState {
  final List<TVEntity> tv;
  SearchTvSuccess({required this.tv});
}

final class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({required this.errorMessage});
}
