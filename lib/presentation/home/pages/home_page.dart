import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/core/assets/app_images.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movies_widget.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv_widget.dart';
import 'package:movie_app/presentation/home/widgets/trending_movies_widget.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: SvgPicture.asset(AppImages.logo),
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
              onPressed: () {
                AppNavigation.push(
                    context,
                    MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => SearchCubit(),
                        ),
                        BlocProvider(
                          create: (context) => SelectableOptionCubit(),
                        ),
                      ],
                      child: const SearchPage(),
                    ));
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategoryText(title: 'Trending'),
            const TrendingMoviesWidget(),
            const CategoryText(title: 'Now Playing', bottom: 6),
            const NowPlayingMoviesWidget(),
            sbH(12),
            const CategoryText(title: 'Popular Tv Shows', bottom: 6),
            const PopularTvWidget(),
            sbH(12),
          ],
        ),
      ),
    );
  }
}
