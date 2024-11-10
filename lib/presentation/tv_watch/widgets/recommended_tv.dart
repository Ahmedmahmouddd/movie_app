import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/presentation/home/widgets/tv_card.dart';
import 'package:movie_app/presentation/tv_watch/bloc/recommended_tv_cubit/recommended_tv_cubit.dart';

class RecommendedTv extends StatelessWidget {
  final int id;
  const RecommendedTv({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RecommendedTvCubit()..getRecommendedTv(id),
        child: BlocBuilder<RecommendedTvCubit, RecommendedTvState>(
          builder: (context, state) {
            if (state is RecommendedTvLoading) {
              return const SizedBox(
                  height: 215, child: Center(child: CircularProgressIndicator(color: AppColors.primary)));
            } else if (state is RecommendedTvSuccess) {
              return SizedBox(
                height: 210,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, index) {
                      return TvCard(tvEntity: state.tv[index]);
                    },
                    separatorBuilder: (context, index) {
                      return sbw(2);
                    },
                    itemCount: state.tv.length),
              );
            } else if (state is RecommendedTvFailure) {
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
