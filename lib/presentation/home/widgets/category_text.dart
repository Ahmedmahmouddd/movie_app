import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String title;
  final double? top;
  final double? bottom;

  const CategoryText({required this.title, super.key,  this.top, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 12, bottom: bottom ?? 0, top: top ?? 0),
        child: Text(title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)));
  }
}
