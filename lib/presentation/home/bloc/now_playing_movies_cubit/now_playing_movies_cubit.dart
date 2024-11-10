import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_app/service_locator.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit() : super(NowPlayingMoviesInitial());

  void getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call();
    returnedData.fold(
      (error) {
        emit(NowPlayingMoviesFailure(errorMessage: error));
      },
      (movies) {
        emit(NowPlayingMoviesSuccess(movies: movies));
      },
    );
  }
}
