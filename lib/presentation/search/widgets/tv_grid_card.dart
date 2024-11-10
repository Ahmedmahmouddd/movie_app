import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/core/assets/app_images.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/presentation/tv_watch/pages/tv_watch_page.dart';

class TvGridCard extends StatelessWidget {
  final TVEntity tvEntity;
  const TvGridCard({super.key, required this.tvEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigation.push(context, TvWatchPage(tvEntity: tvEntity)),
      child: Card(
        color: AppColors.secondaryBackground,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: AspectRatio(
                aspectRatio: 1 / 1.3,
                child: CachedNetworkImage(
                  imageUrl: AppImages.apiImagePath + tvEntity.posterPath.toString(),
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(FontAwesomeIcons.exclamation),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tvEntity.name.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.star_rounded, color: Colors.yellow, size: 16),
                        sbw(2),
                        Text(
                          tvEntity.voteAverage!.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
