import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class Overview extends StatelessWidget {
  final String overView;
  const Overview({super.key, required this.overView});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Overview',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          sbH(4),
          Text(overView, style: const TextStyle(color: AppColors.accent, fontSize: 16)),
        ],
      ),
    );
  }
}
