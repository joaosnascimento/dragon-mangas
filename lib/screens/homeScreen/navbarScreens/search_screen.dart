import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 24, 24, 100),
      body: Center(
        child: Text(
          'Procurar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
