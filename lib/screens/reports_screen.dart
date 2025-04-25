import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final List<String> reports = [
    'Reporte 1: Sentimiento de estrés.',
    'Reporte 2: Sentimiento de motivación.'
  ];
  final TextEditingController _controller = TextEditingController();

  void _addReport() {
    final newReport = _controller.text.trim();
    if (newReport.isNotEmpty) {
      setState(() {
        reports.add(newReport);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Reportes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Reportes de Estado',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.assignment),
                      title: Text(reports[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nuevo reporte de estado',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _addReport,
              icon: const Icon(Icons.add_box),
              label: const Text('Añadir Reporte'),
            ),
          ],
        ),
      ),
    );
  }
}
