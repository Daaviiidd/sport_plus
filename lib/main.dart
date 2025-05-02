import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/emotion_log_screen.dart';
import 'screens/relaxation_tools_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/performance_stats_screen.dart';
import 'screens/coach_panel_screen.dart';

void main() {
  runApp(const SportPlusApp());
}

class SportPlusApp extends StatelessWidget {
  const SportPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport Plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey[900],
        primaryColor: Colors.tealAccent[700],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/emotion': (context) => const EmotionLogScreen(),
        '/relaxation': (context) => const RelaxationToolsScreen(),
        '/reports': (context) => const ReportsScreen(),
        '/performance': (context) => const PerformanceStatsScreen(),
        '/coach': (context) => const CoachPanelScreen(),
      },
    );
  }
}
