import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'screens/relaxation_tools_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/emotion_log_screen.dart';
import 'screens/coach_panel_screen.dart';

void main() {
  runApp(const SportPlusApp());
}

class SportPlusApp extends StatelessWidget {
  const SportPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isWeb = defaultTargetPlatform == TargetPlatform.fuchsia ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux;

    return MaterialApp(
      title: 'Sport +',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // Soporte modo claro/oscuro
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'OpenSans'),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.indigo,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: isWeb ? const WebWrapper() : const HomeScreen(),
    );
  }
}

class WebWrapper extends StatelessWidget {
  const WebWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport +'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Bienvenido, atleta 👋',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              HomeActionButton(
                icon: Icons.edit_note,
                label: 'Registrar Estado Emocional',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EmotionLogScreen()),
                ),
              ),
              HomeActionButton(
                icon: Icons.self_improvement,
                label: 'Técnicas de Relajación',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const RelaxationToolsScreen()),
                ),
              ),
              HomeActionButton(
                icon: Icons.bar_chart,
                label: 'Ver Reportes',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReportsScreen()),
                ),
              ),
              HomeActionButton(
                icon: Icons.group,
                label: 'Panel de Entrenador',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CoachPanelScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const HomeActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: onPressed,
      ),
    );
  }
}
