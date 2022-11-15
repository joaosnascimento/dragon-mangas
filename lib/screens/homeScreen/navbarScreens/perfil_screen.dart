import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 24, 24, 100),
      body: Center(
        child: Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
