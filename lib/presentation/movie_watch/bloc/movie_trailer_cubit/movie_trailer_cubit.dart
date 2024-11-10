import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'movie_trailer_state.dart';

class MovieTrailerCubit extends Cubit<MovieTrailerState> {
  MovieTrailerCubit() : super(MovieTrailerInitial());

  void getMovieTrailer(int movieId) async {
    emit(MovieTrailerLoading());
    var returnedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(MovieTrailerFailure(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController youtubePlayerController = YoutubePlayerController(
            initialVideoId: trailerEntity.key!, flags: const YoutubePlayerFlags(autoPlay: false));
        emit(MovieTrailerSuccess(youtubePlayerController: youtubePlayerController));
      },
    );
  }
}
