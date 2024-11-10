import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class FirstAirDateAndAverageRate extends StatelessWidget {
  final String firstAirDate;
  final num rateAverage;
  final int voteCount;

  const FirstAirDateAndAverageRate(
      {required this.firstAirDate, required this.rateAverage, super.key, required this.voteCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_month_rounded, color: AppColors.accent, size: 20),
              sbw(4),
              Text(firstAirDate.toString().substring(0, 10), style: const TextStyle(color: AppColors.accent)),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.star_rounded, color: Color.fromARGB(255, 255, 215, 0), size: 20),
              sbw(3),
              Text(rateAverage.toStringAsFixed(1)),
              Text(' (${voteCount.toString()})', style: const TextStyle(color: AppColors.accent)),
            ],
          ),
        ],
      ),
    );
  }
}
