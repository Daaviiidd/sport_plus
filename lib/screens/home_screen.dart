import 'package:flutter/material.dart';
import 'relaxation_tools_screen.dart';
import 'reports_screen.dart';
import 'emotion_log_screen.dart';
import 'coach_panel_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport +'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit_note),
              title: const Text('Registrar Estado Emocional'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EmotionLogScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.self_improvement),
              title: const Text('Técnicas de Relajación'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const RelaxationToolsScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Ver Reportes'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportsScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Panel de Entrenador'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CoachPanelScreen()),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenido, atleta 👋',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit_note),
              label: const Text('Registrar Estado Emocional'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EmotionLogScreen()),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.self_improvement),
              label: const Text('Técnicas de Relajación'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const RelaxationToolsScreen()),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.bar_chart),
              label: const Text('Ver Reportes'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportsScreen()),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.group),
              label: const Text('Panel de Entrenador'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CoachPanelScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
