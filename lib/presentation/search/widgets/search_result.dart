import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/widgets/movie_grid_card.dart';
import 'package:movie_app/presentation/search/widgets/tv_grid_card.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectableOptionCubit, SearchType>(
      listener: (context, state) {
        context.read<SearchCubit>().clearResults();
      },
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          } else if (state is SearchMoviesSuccess) {
            return SingleChildScrollView(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 3 / 4.6,
                ),
                itemBuilder: (context, index) => MovieGridCard(movieEntity: state.movies[index]),
                itemCount: state.movies.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            );
          } else if (state is SearchTvSuccess) {
            return SingleChildScrollView(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 3 / 4.6,
                ),
                itemBuilder: (context, index) => TvGridCard(tvEntity: state.tv[index]),
                itemCount: state.tv.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            );
          } else if (state is SearchFailure) {
            return Center(
                child: Text(state.errorMessage,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)));
          } else if (state is SearchInitial) {
            return const Center(
              child: Text("Search for movies or TV shows",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            );
          } else {
            return const Center(
              child: Text('There was an unexpected error.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            );
          }
        },
      ),
    );
  }
}
