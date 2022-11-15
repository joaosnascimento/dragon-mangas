import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 24, 24, 100),
      body: Center(
        child: Text(
          'Biblioteca',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
