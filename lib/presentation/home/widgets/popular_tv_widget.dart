import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_cubit/popular_tv_cubit.dart';
import 'package:movie_app/presentation/home/widgets/tv_card.dart';

class PopularTvWidget extends StatelessWidget {
  const PopularTvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PopularTVCubit()..getPopularTV(),
        child: BlocBuilder<PopularTVCubit, PopularTVState>(
          builder: (context, state) {
            if (state is PopularTVLoading) {
              return const SizedBox(
                  height: 215, child: Center(child: CircularProgressIndicator(color: AppColors.primary)));
            } else if (state is PopularTVSuccess) {
              return SizedBox(
                height: 210,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, index) {
                      return TvCard(tvEntity: state.tv[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 4);
                    },
                    itemCount: state.tv.length),
              );
            } else if (state is PopularTVFailure) {
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
