import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? action;
  final Widget? leading;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  final bool? centerTitle;

  const CustomAppBar({
    this.title,
    this.hideBack = true,
    this.action,
    this.backgroundColor,
    this.height,
    this.leading,
    super.key,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: action,
      title: title,
      leading: hideBack
          ? null
          : leading ??
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(FontAwesomeIcons.chevronLeft)),
      surfaceTintColor: backgroundColor ?? AppColors.background,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? AppColors.background,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}
