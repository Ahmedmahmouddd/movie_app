import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_similar_tv.dart';
import 'package:movie_app/service_locator.dart';

part 'similar_tv_state.dart';

class SimilarTvCubit extends Cubit<SimilarTvState> {
  SimilarTvCubit() : super(SimilarTvInitial());
  void getSimilarTv(int tvId) async {
    emit(SimilarTvLoading());
    var returnedData = await sl<GetSimilarTvUseCase>().call(params: tvId);
    returnedData.fold(
      (error) {
        emit(SimilarTvFailure(errorMessage: error));
      },
      (data) {
        emit(SimilarTvSuccess(tv: data));
      },
    );
  }
}
