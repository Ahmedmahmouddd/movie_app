import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_recommended_movies.dart';
import 'package:movie_app/service_locator.dart';

part 'recommended_movies_state.dart';

class RecommendedMoviesCubit extends Cubit<RecommendedMoviesState> {
  RecommendedMoviesCubit() : super(RecommendedMoviesInitial());
  void getRecommendedmovies(int movieId) async {
    emit(RecommendedMoviesLoading());
    var returnedData = await sl<GetRecommendedMoviesUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(RecommendedMoviesFailure(errorMessage: error));
      },
      (data) {
        emit(RecommendedMoviesSuccess(movies: data));
      },
    );
  }
}
