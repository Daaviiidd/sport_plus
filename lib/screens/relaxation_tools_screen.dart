import 'package:flutter/material.dart';

class RelaxationToolsScreen extends StatelessWidget {
  const RelaxationToolsScreen({super.key});

  final List<Map<String, String>> techniques = const [
    {
      'title': 'Respiración profunda',
      'description':
          'Inhala lentamente por la nariz durante 4 segundos, mantén por 4 segundos, exhala por la boca durante 6 segundos.'
    },
    {
      'title': 'Relajación muscular progresiva',
      'description':
          'Tensa y relaja grupos musculares desde los pies hasta la cabeza, uno por uno.'
    },
    {
      'title': 'Visualización guiada',
      'description':
          'Cierra los ojos e imagina un lugar tranquilo y seguro donde te sientas en paz.'
    },
    {
      'title': 'Meditación consciente',
      'description':
          'Enfócate en tu respiración y deja que los pensamientos pasen sin juzgarlos.'
    },
  ];

  void _openTechnique(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.blueGrey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        content:
            Text(description, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            child: const Text('Cerrar',
                style: TextStyle(color: Colors.tealAccent)),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('Técnicas de Relajación'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: techniques.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final item = techniques[index];
          return Card(
            color: Colors.tealAccent[700],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: const Icon(Icons.self_improvement,
                  color: Colors.white, size: 32),
              title: Text(
                item['title']!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onTap: () =>
                  _openTechnique(context, item['title']!, item['description']!),
            ),
          );
        },
      ),
    );
  }
}
