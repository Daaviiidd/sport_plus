import 'package:flutter/material.dart';

class RelaxationToolsScreen extends StatelessWidget {
  const RelaxationToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      {
        'title': 'Respiración Guiada',
        'description': 'Inhala y exhala lentamente.'
      },
      {
        'title': 'Meditación',
        'description': 'Meditación de 5 minutos para calmarte.'
      },
      {'title': 'Visualización', 'description': 'Imagina un lugar tranquilo.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Técnicas de Relajación')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tools.length,
        itemBuilder: (_, index) {
          final tool = tools[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(tool['title']!),
              subtitle: Text(tool['description']!),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(tool['title']!),
                    content: Text(tool['description']!),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cerrar'),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
