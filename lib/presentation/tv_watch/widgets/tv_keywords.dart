import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/presentation/tv_watch/bloc/tv_keywords_cubit/tv_keywords_cubit.dart';
import 'package:movie_app/presentation/tv_watch/widgets/keyword_chip.dart';

class TvKeywords extends StatelessWidget {
  final int id;
  const TvKeywords({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TvKeywordsCubit()..getTvKeywords(id),
      child: BlocBuilder<TvKeywordsCubit, TvKeywordsState>(
        builder: (context, state) {
          if (state is TvKeywordsLoading) {
            return const SizedBox(
                height: 40, child: Center(child: CircularProgressIndicator(color: AppColors.primary)));
          } else if (state is TvKeywordsSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                spacing: 8,
                children: state.keywords.map((item) => KeywordChip(title: item.name!)).toList(),
              ),
            );
          } else if (state is TvKeywordsFailure) {
            return SizedBox(
                height: 40,
                child: Center(
                    child: Text(state.errorMessage,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))));
          } else {
            return const Text('There was an unexpected error.');
          }
        },
      ),
    );
  }
}
