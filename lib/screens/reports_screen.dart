import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reportes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Estado Emocional (Últimos 7 días)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          const days = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
                          return Text(days[value.toInt() % 7]);
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          return Text(value.toInt().toString());
                        },
                      ),
                    ),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 10,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 5),
                        FlSpot(1, 6),
                        FlSpot(2, 7.5),
                        FlSpot(3, 6),
                        FlSpot(4, 8),
                        FlSpot(5, 7),
                        FlSpot(6, 9),
                      ],
                      isCurved: true,
                      color: Colors.indigo,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                          show: true, color: Colors.indigo.withOpacity(0.3)),
                      dotData: FlDotData(show: true),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nivel emocional: 0 = Bajo, 10 = Excelente',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
