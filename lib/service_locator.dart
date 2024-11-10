import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_service.dart';
import 'package:movie_app/data/movie/repositories/movie.dart';
import 'package:movie_app/data/movie/sources/movie_service.dart';
import 'package:movie_app/data/tv/repositories/tv.dart';
import 'package:movie_app/data/tv/sources/tv_service.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_search_result.dart';
import 'package:movie_app/domain/movie/usecases/get_recommended_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_tv_keywords.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_recommended_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_similar_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_tv_search_results.dart';
import 'package:movie_app/domain/tv/usecases/get_tv_trailer.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<DioClient>((DioClient()));

  // Services
  sl.registerSingleton<AuthService>(AuthServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());
  sl.registerSingleton<TVService>(TVServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  // Use Cases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetTvTrailerUseCase>(GetTvTrailerUseCase());
  sl.registerSingleton<GetRecommendedMoviesUseCase>(GetRecommendedMoviesUseCase());
  sl.registerSingleton<GetRecommendedTvUseCase>(GetRecommendedTvUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
  sl.registerSingleton<GetSimilarTvUseCase>(GetSimilarTvUseCase());
  sl.registerSingleton<GetTvkeywordsUseCase>(GetTvkeywordsUseCase());
  sl.registerSingleton<GetMovieSearchResulsUseCase>(GetMovieSearchResulsUseCase());
  sl.registerSingleton<GetTvSearchResulsUseCase>(GetTvSearchResulsUseCase());
}
