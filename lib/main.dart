import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/performance_stats_screen.dart';
import 'screens/emotion_log_screen.dart';
import 'screens/relaxation_tools_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/coach_panel_screen.dart';

void main() {
  runApp(const SportPlusApp());
}

class SportPlusApp extends StatelessWidget {
  const SportPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sport Plus',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const PerformanceStatsScreen(),
        '/emotion_log': (context) => const EmotionLogScreen(),
        '/relaxation': (context) => const RelaxationToolsScreen(),
        '/reports': (context) => const ReportsScreen(),
        '/coach': (context) => const CoachPanelScreen(),
      },
    );
  }
}
