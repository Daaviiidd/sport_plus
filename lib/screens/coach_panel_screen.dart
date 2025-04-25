import 'package:flutter/material.dart';

class CoachPanelScreen extends StatelessWidget {
  const CoachPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel de Entrenador')),
      body: const Center(
        child: Text(
          'Visualización del estado de los atletas (en construcción)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
