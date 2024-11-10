import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_search_result.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_tv_search_results.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit/selectable_option_cubit.dart';
import 'package:movie_app/service_locator.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void clearResults() {
    emit(SearchInitial());
  }

  void search(String query, SearchType searchType) async {
    emit(SearchLoading());
    switch (searchType) {
      case SearchType.movie:
        {
          var returnedData = await sl<GetMovieSearchResulsUseCase>().call(params: query);
          returnedData.fold(
            (error) {
              emit(SearchFailure(errorMessage: error));
            },
            (data) {
              emit(SearchMoviesSuccess(movies: data));
            },
          );
          break;
        }
      case SearchType.tv:
        {
          var returnedData = await sl<GetTvSearchResulsUseCase>().call(params: query);
          returnedData.fold(
            (error) {
              emit(SearchFailure(errorMessage: error));
            },
            (data) {
              emit(SearchTvSuccess(tv: data));
            },
          );
          break;
        }
    }
  }
}
