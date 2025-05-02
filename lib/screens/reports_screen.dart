import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  // Simulación de reportes emocionales (podría venir de base de datos)
  final List<Map<String, String>> reports = const [
    {
      'date': '01/05/2025',
      'emotion': '😊 Feliz',
      'note': 'Hoy me sentí motivado después del entrenamiento.'
    },
    {
      'date': '30/04/2025',
      'emotion': '😔 Triste',
      'note': 'Perdimos el partido, me sentí un poco desanimado.'
    },
    {
      'date': '29/04/2025',
      'emotion': '😎 Motivado',
      'note': 'Logré superar mi marca personal en velocidad.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('Reportes de Estado'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            color: Colors.blueGrey[700],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Text(
                report['emotion']!,
                style: const TextStyle(fontSize: 26),
              ),
              title: Text(
                report['note']!,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                report['date']!,
                style: const TextStyle(color: Colors.white60),
              ),
            ),
          );
        },
      ),
    );
  }
}
