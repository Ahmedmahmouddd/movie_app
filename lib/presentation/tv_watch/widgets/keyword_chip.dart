import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class KeywordChip extends StatelessWidget {
  final String title;
  const KeywordChip({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
        label: Text(title),
        labelStyle: const TextStyle(color: AppColors.accent, fontSize: 14, fontWeight: FontWeight.w500));
  }
}
