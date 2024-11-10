import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/domain/tv/usecases/get_tv_trailer.dart';
import 'package:movie_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'tv_trailer_state.dart';

class TvTrailerCubit extends Cubit<TvTrailerState> {
  TvTrailerCubit() : super(TvTrailerInitial());

  void getTvTrailer(int tvId) async {
    emit(TvTrailerLoading());
    var returnedData = await sl<GetTvTrailerUseCase>().call(params: tvId);
    returnedData.fold(
      (error) {
        emit(TvTrailerFailure(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController youtubePlayerController = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(autoPlay: false),
        );
        emit(TvTrailerSuccess(youtubePlayerController: youtubePlayerController));
      },
    );
  }
}
