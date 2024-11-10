import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/widgets/movie_selector.dart';
import 'package:movie_app/presentation/search/widgets/search_result.dart';
import 'package:movie_app/presentation/search/widgets/search_textfield.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hideBack: false,
        title: SearchTextField(
            onSubmitted: (query) =>
                context.read<SearchCubit>().search(query, context.read<SelectableOptionCubit>().state)),
      ),
      body: const Column(
        children: [
          MovieSelector(),
          Expanded(child: SearchResult()),
        ],
      ),
    );
  }
}
