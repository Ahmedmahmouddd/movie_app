import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/presentation/home/widgets/movie_card.dart';
import 'package:movie_app/presentation/movie_watch/bloc/recommend_movies_cubit/recommended_movies_cubit.dart';

class RecommendedMovies extends StatelessWidget {
  final int id;
  const RecommendedMovies({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RecommendedMoviesCubit()..getRecommendedmovies(id),
        child: BlocBuilder<RecommendedMoviesCubit, RecommendedMoviesState>(
          builder: (context, state) {
            if (state is RecommendedMoviesLoading) {
              return const SizedBox(
                  height: 215, child: Center(child: CircularProgressIndicator(color: AppColors.primary)));
            } else if (state is RecommendedMoviesSuccess) {
              return SizedBox(
                height: 210,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.movies[index]);
                    },
                    separatorBuilder: (context, index) {
                      return sbw(2);
                    },
                    itemCount: state.movies.length),
              );
            } else if (state is RecommendedMoviesFailure) {
              return SizedBox(
                  height: 310,
                  child: Center(
                      child: Text(state.errorMessage,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))));
            } else {
              return const Text('There was an unexpected error.');
            }
          },
        ));
  }
}
