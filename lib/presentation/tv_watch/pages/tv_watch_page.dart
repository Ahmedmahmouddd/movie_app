import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/presentation/movie_watch/widgets/header_text.dart';
import 'package:movie_app/presentation/movie_watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/movie_watch/widgets/video_title.dart';
import 'package:movie_app/presentation/tv_watch/widgets/air_date_and_average_rate.dart';
import 'package:movie_app/presentation/tv_watch/widgets/recommended_tv.dart';
import 'package:movie_app/presentation/tv_watch/widgets/similar_tv.dart';
import 'package:movie_app/presentation/tv_watch/widgets/tv_keywords.dart';
import 'package:movie_app/presentation/tv_watch/widgets/tv_trailer_player.dart';

class TvWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TvWatchPage({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(hideBack: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TvTrailerPlayer(id: tvEntity.id!, tvEntity: tvEntity),
            sbH(10),
            VideoTitle(title: tvEntity.name!),
            sbH(8),
            TvKeywords(id: tvEntity.id!),
            sbH(8),
            FirstAirDateAndAverageRate(
                voteCount: tvEntity.voteCount!,
                firstAirDate: tvEntity.firstAirDate!,
                rateAverage: tvEntity.voteAverage!),
            sbH(8),
            Overview(overView: tvEntity.overview!),
            sbH(8),
            const HeaderText(title: 'Recommended Shows'),
            sbH(4),
            RecommendedTv(id: tvEntity.id!),
            sbH(8),
            const HeaderText(title: 'Similar Shows'),
            sbH(4),
            SimilarTv(id: tvEntity.id!),
            sbH(12),
          ],
        ),
      ),
    );
  }
}
