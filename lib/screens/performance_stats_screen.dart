import 'package:flutter/material.dart';

class PerformanceStatsScreen extends StatelessWidget {
  const PerformanceStatsScreen({super.key});

  final List<Map<String, dynamic>> stats = const [
    {'label': 'Energía', 'value': 0.75, 'color': Colors.green},
    {'label': 'Motivación', 'value': 0.9, 'color': Colors.teal},
    {'label': 'Estrés', 'value': 0.3, 'color': Colors.orange},
    {'label': 'Concentración', 'value': 0.85, 'color': Colors.blueAccent},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('Estadísticas de Rendimiento'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: stats.map((stat) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stat['label'],
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: LinearProgressIndicator(
                    value: stat['value'],
                    minHeight: 20,
                    backgroundColor: Colors.blueGrey[700],
                    valueColor: AlwaysStoppedAnimation<Color>(stat['color']),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
