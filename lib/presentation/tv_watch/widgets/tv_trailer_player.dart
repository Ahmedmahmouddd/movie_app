import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/assets/app_images.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/presentation/tv_watch/bloc/tv_trailer_cubit/tv_trailer_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvTrailerPlayer extends StatefulWidget {
  final TVEntity tvEntity;
  final int id;
  const TvTrailerPlayer({required this.tvEntity, required this.id, super.key});

  @override
  State<TvTrailerPlayer> createState() => _TvTrailerPlayerState();
}

class _TvTrailerPlayerState extends State<TvTrailerPlayer> {
  bool showYouTubePlayer = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TvTrailerCubit()..getTvTrailer(widget.id),
        child: BlocBuilder<TvTrailerCubit, TvTrailerState>(
          builder: (context, state) {
            if (state is TvTrailerLoading) {
              return const AspectRatio(
                aspectRatio: 16 / 8.5,
                child: SizedBox(
                    width: double.infinity,
                    child: Center(child: CircularProgressIndicator(color: AppColors.primary))),
              );
            } else if (state is TvTrailerSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: showYouTubePlayer == true
                          ? YoutubePlayer(
                              controller: state.youtubePlayerController,
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: AppColors.secondaryBackground,
                              progressColors: const ProgressBarColors(
                                playedColor: AppColors.primary,
                                handleColor: AppColors.primary,
                              ),
                            )
                          : AspectRatio(
                              aspectRatio: 16 / 9,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showYouTubePlayer = true;
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.network(
                                        width: double.infinity,
                                        AppImages.apiImagePath + widget.tvEntity.posterPath.toString(),
                                        fit: BoxFit.cover),
                                    const Icon(Icons.play_arrow_rounded, size: 64, color: Colors.white),
                                  ],
                                ),
                              ),
                            )),
                ),
              );
            } else if (state is TvTrailerFailure) {
              return AspectRatio(
                aspectRatio: 16 / 8.5,
                child: SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      state.errorMessage,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ))),
              );
            } else {
              return const Text('There was an unexpected error.');
            }
          },
        ));
  }
}
