import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app/service_locator.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit() : super(TrendingMoviesInitial());

  void getTrendingMovies() async {
    emit(TrendingMoviesLoading());
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold(
      (error) {
        emit(TrendingMoviesFailure(errorMessage: error));
      },
      (data) {
        emit(TrendingMoviesSuccess(movies: data));
      },
    );
  }
}
