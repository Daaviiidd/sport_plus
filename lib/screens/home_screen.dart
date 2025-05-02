import 'package:flutter/material.dart';
import 'emotion_log_screen.dart';
import 'relaxation_tools_screen.dart';
import 'reports_screen.dart';
import 'performance_stats_screen.dart';
import 'coach_panel_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MenuOption> options = [
      _MenuOption(
        icon: Icons.mood,
        label: 'Registro Emocional',
        screen: const EmotionLogScreen(),
      ),
      _MenuOption(
        icon: Icons.self_improvement,
        label: 'Relajación',
        screen: const RelaxationToolsScreen(),
      ),
      _MenuOption(
        icon: Icons.article,
        label: 'Reportes',
        screen: const ReportsScreen(),
      ),
      _MenuOption(
        icon: Icons.bar_chart,
        label: 'Estadísticas',
        screen: const PerformanceStatsScreen(),
      ),
      _MenuOption(
        icon: Icons.supervisor_account,
        label: 'Panel Entrenador',
        screen: const CoachPanelScreen(),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Bienvenido a Sport Plus'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final option = options[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => option.screen),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.tealAccent[700],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(option.icon, size: 50, color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    option.label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MenuOption {
  final IconData icon;
  final String label;
  final Widget screen;

  _MenuOption({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
