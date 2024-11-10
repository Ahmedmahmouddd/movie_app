import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/service_locator.dart';

part 'popular_tv_state.dart';

class PopularTVCubit extends Cubit<PopularTVState> {
  PopularTVCubit() : super(PopularTVInitial());

  void getPopularTV() async {
    emit(PopularTVLoading());
    var returnedData = await sl<GetPopularTvUseCase>().call();
    returnedData.fold(
      (error) {
        emit(PopularTVFailure(errorMessage: error));
      },
      (data) {
        emit(PopularTVSuccess(tv: data));
      },
    );
  }
}
