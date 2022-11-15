import 'package:flutter/material.dart';

class VertDivider extends StatelessWidget {
  const VertDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: Colors.white,
      endIndent: 32,
      thickness: 1,
    );
  }
}
