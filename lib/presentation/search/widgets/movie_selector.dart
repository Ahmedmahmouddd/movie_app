import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/widgets/selectable_search_option.dart';

class MovieSelector extends StatelessWidget {
  const MovieSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableSearchOption(
              title: 'Movie',
              selected: context.read<SelectableOptionCubit>().state == SearchType.movie,
              onTap: () {
                BlocProvider.of<SelectableOptionCubit>(context).selectMovie();
              },
            ),
            sbw(20),
            SelectableSearchOption(
              title: 'Tv Show',
              selected: context.read<SelectableOptionCubit>().state == SearchType.tv,
              onTap: () {
                BlocProvider.of<SelectableOptionCubit>(context).selectTv();
              },
            ),
          ],
        );
      },
    );
  }
}
