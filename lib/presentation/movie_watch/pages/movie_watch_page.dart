import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/presentation/movie_watch/widgets/recommended_movies.dart';
import 'package:movie_app/presentation/movie_watch/widgets/release_data_and_rating.dart';
import 'package:movie_app/presentation/movie_watch/widgets/similar_movies.dart';
import 'package:movie_app/presentation/movie_watch/widgets/movie_trailer_player.dart';
import 'package:movie_app/presentation/movie_watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/movie_watch/widgets/video_title.dart';
import 'package:movie_app/presentation/movie_watch/widgets/header_text.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(hideBack: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieTrailerPlayer(id: movieEntity.id!, movieEntity: movieEntity),
            sbH(10),
            VideoTitle(title: movieEntity.title!),
            sbH(8),
            ReleaseDateAndAverageRate(
                voteCount: movieEntity.voteCount!,
                releaseDate: movieEntity.releaseDate != null
                    ? movieEntity.releaseDate!.toString().substring(0, 10)
                    : 'Unknown',
                rateAverage: movieEntity.voteAverage!),
            sbH(8),
            Overview(overView: movieEntity.overview!),
            sbH(8),
            const HeaderText(title: 'Recommended Movies'),
            sbH(4),
            RecommendedMovies(id: movieEntity.id!),
            sbH(8),
            const HeaderText(title: 'Similar Movies'),
            sbH(4),
            SimilarMovies(id: movieEntity.id!),
            sbH(12),
          ],
        ),
      ),
    );
  }
}
