import 'package:flutter/material.dart';

class MangaInfoBar extends StatelessWidget {
  final IconData icon;
  final String title;

  const MangaInfoBar({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.blueAccent,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
