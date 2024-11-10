import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_recommended_tv.dart';
import 'package:movie_app/service_locator.dart';

part 'recommended_tv_state.dart';

class RecommendedTvCubit extends Cubit<RecommendedTvState> {
  RecommendedTvCubit() : super(RecommendedTvInitial());
  void getRecommendedTv(int tvId) async {
    emit(RecommendedTvLoading());
    var returnedData = await sl<GetRecommendedTvUseCase>().call(params: tvId);
    returnedData.fold(
      (error) {
        emit(RecommendedTvFailure(errorMessage: error));
      },
      (data) {
        emit(RecommendedTvSuccess(tv: data));
      },
    );
  }
}
