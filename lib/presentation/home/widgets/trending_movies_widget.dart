import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/assets/app_images.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/presentation/home/bloc/trending_movies_cubit/trending_movies_cubit.dart';

class TrendingMoviesWidget extends StatelessWidget {
  const TrendingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrendingMoviesCubit()..getTrendingMovies(),
        child: BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
          builder: (context, state) {
            if (state is TrendingMoviesLoading) {
              return const SizedBox(
                  height: 310, child: Center(child: CircularProgressIndicator(color: AppColors.primary)));
            } else if (state is TrendingMoviesSuccess) {
              return FanCarouselImageSlider.sliderType1(
                imagesLink:
                    state.movies.map((item) => AppImages.apiImagePath + item.posterPath.toString()).toList(),
                isAssets: false,
                sliderDuration: const Duration(milliseconds: 200),
                slideViewportFraction: 0.55,
                isClickable: false,
                sliderHeight: 310,
                showIndicator: false,
              );
            } else if (state is TrendingMoviesFailure) {
              return SizedBox(
                  height: 310,
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
