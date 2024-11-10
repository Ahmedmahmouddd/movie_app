import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/presentation/home/widgets/movie_card.dart';
import 'package:movie_app/presentation/movie_watch/bloc/movie_similars_cubit/movie_similars_cubit.dart';

class SimilarMovies extends StatelessWidget {
  final int id;
  const SimilarMovies({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SimilarMoviesCubit()..getSimilarMovies(id),
        child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
          builder: (context, state) {
            if (state is SimilarMoviesLoading) {
              return const SizedBox(
                  height: 215, child: Center(child: CircularProgressIndicator(color: AppColors.primary)));
            } else if (state is SimilarMoviesSuccess) {
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
            } else if (state is SimilarMoviesFailure) {
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
