import 'package:flutter/material.dart';

class PerformanceStatsScreen extends StatelessWidget {
  const PerformanceStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport +'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit_note),
              title: const Text('Registrar Estado Emocional'),
              onTap: () {
                Navigator.pushNamed(context, '/emotion_log');
              },
            ),
            ListTile(
              leading: const Icon(Icons.self_improvement),
              title: const Text('Técnicas de Relajación'),
              onTap: () {
                Navigator.pushNamed(context, '/relaxation');
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Ver Reportes'),
              onTap: () {
                Navigator.pushNamed(context, '/reports');
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Panel de Entrenador'),
              onTap: () {
                Navigator.pushNamed(context, '/coach');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          '📊 Estadísticas del rendimiento\n(próximamente)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
