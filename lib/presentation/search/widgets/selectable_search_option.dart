import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class SelectableSearchOption extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  const SelectableSearchOption({super.key, required this.title, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: selected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.primary,
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withOpacity(0.7), spreadRadius: 1, blurRadius: 6),
                ],
              )
            : BoxDecoration(borderRadius: BorderRadius.circular(14), color: AppColors.accent),
        width: 120,
        height: 45,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
