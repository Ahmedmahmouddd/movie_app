import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/entity/keyword.dart';
import 'package:movie_app/domain/tv/usecases/get_tv_keywords.dart';
import 'package:movie_app/service_locator.dart';

part 'tv_keywords_state.dart';

class TvKeywordsCubit extends Cubit<TvKeywordsState> {
  TvKeywordsCubit() : super(TvKeywordsInitial());

  void getTvKeywords(int tvId) async {
    emit(TvKeywordsLoading());
    var returnedData = await sl<GetTvkeywordsUseCase>().call(params: tvId);
    returnedData.fold(
      (error) {
        emit(TvKeywordsFailure(errorMessage: error));
      },
      (data) {
        emit(TvKeywordsSuccess(keywords: data));
      },
    );
  }
}
