import 'dart:async';
import 'package:flutter/material.dart';

class RelaxationToolsScreen extends StatelessWidget {
  const RelaxationToolsScreen({super.key});

  void showBreathingExercise(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => BreathingExerciseDialog(),
    );
  }

  void showMeditationInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text('Meditación Guiada'),
        content: Text(
          'Encuentra un lugar cómodo, cierra los ojos y concéntrate en tu respiración. Usa audios de meditación si lo deseas.',
        ),
      ),
    );
  }

  void showVisualizationInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text('Visualización Positiva'),
        content: Text(
          'Imagina tu mejor versión logrando tus objetivos. Visualízalo con todos los detalles posibles para motivarte.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Técnicas de Relajación')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: const Text('Respiración Profunda'),
              subtitle: const Text('Guía paso a paso para calmarte'),
              leading: const Icon(Icons.air),
              onTap: () => showBreathingExercise(context),
            ),
          ),
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: const Text('Meditación Guiada'),
              subtitle: const Text('Relaja tu mente con una sesión de audio'),
              leading: const Icon(Icons.headset),
              onTap: () => showMeditationInfo(context),
            ),
          ),
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: const Text('Visualización Positiva'),
              subtitle:
                  const Text('Imagina tu mejor versión antes de competir'),
              leading: const Icon(Icons.wb_sunny),
              onTap: () => showVisualizationInfo(context),
            ),
          ),
        ],
      ),
    );
  }
}

class BreathingExerciseDialog extends StatefulWidget {
  @override
  _BreathingExerciseDialogState createState() =>
      _BreathingExerciseDialogState();
}

class _BreathingExerciseDialogState extends State<BreathingExerciseDialog> {
  int _step = 0;
  late Timer _timer;
  final List<String> _steps = [
    'Inhala profundamente...',
    'Mantén el aire...',
    'Exhala lentamente...',
    'Descansa...',
  ];

  @override
  void initState() {
    super.initState();
    _startBreathing();
  }

  void _startBreathing() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _step = (_step + 1) % _steps.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ejercicio de Respiración'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _steps[_step],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text('Respira con el ritmo y repite por unos minutos.'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cerrar'),
        )
      ],
    );
  }
}
