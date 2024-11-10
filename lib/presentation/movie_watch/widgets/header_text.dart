import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String title;
  const HeaderText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
