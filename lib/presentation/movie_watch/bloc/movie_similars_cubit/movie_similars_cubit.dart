import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_app/service_locator.dart';

part 'movie_similars_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(MovieSimilarsInitial());
  void getSimilarMovies(int movieId) async {
    emit(SimilarMoviesLoading());
    var returnedData = await sl<GetSimilarMoviesUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(SimilarMoviesFailure(errorMessage: error));
      },
      (data) {
        emit(SimilarMoviesSuccess(movies: data));
      },
    );
  }
}
