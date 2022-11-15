import 'package:flutter/material.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 24, 24, 100),
      body: Center(
        child: Text(
          'Configuração',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
