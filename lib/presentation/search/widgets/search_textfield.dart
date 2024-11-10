import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final void Function(String)? onSubmitted;
  final TextEditingController controller = TextEditingController();
  SearchTextField({super.key, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
        cursorColor: AppColors.accent,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(FontAwesomeIcons.xmark, size: 20, color: AppColors.accent),
            onPressed: () {
              controller.clear();
            },
          ),
          alignLabelWithHint: true,
          hintText: 'Search',
          hintStyle: const TextStyle(color: AppColors.accent, fontSize: 17, fontWeight: FontWeight.w500),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide.none),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide.none),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20, color: AppColors.accent),
        ),
      ),
    );
  }
}
