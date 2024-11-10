import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:movie_app/presentation/home/widgets/movie_card.dart';

class NowPlayingMoviesWidget extends StatelessWidget {
  const NowPlayingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NowPlayingMoviesCubit()..getNowPlayingMovies(),
        child: BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
          builder: (context, state) {
            if (state is NowPlayingMoviesLoading) {
              return const SizedBox(
                  height: 215, child: Center(child: CircularProgressIndicator(color: AppColors.primary)));
            } else if (state is NowPlayingMoviesSuccess) {
              return SizedBox(
                height: 210,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.movies[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 4);
                    },
                    itemCount: state.movies.length),
              );
            } else if (state is NowPlayingMoviesFailure) {
              return SizedBox(
                  height: 215,
                  child: Center(
                      child: Text(state.errorMessage,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18))));
            } else {
              return const Text('There was an unexpected error.');
            }
          },
        ));
  }
}
