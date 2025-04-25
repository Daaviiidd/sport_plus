import 'package:flutter/material.dart';

class CoachPanelScreen extends StatefulWidget {
  const CoachPanelScreen({super.key});

  @override
  State<CoachPanelScreen> createState() => _CoachPanelScreenState();
}

class _CoachPanelScreenState extends State<CoachPanelScreen> {
  final List<String> athletes = ['Juan Pérez', 'Laura Gómez', 'Carlos Ruiz'];
  final TextEditingController _controller = TextEditingController();

  void _addAthlete() {
    final newAthlete = _controller.text.trim();
    if (newAthlete.isNotEmpty) {
      setState(() {
        athletes.add(newAthlete);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Entrenador'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Lista de Atletas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: athletes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(athletes[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nombre del nuevo atleta',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _addAthlete,
              icon: const Icon(Icons.person_add),
              label: const Text('Añadir Atleta'),
            ),
          ],
        ),
      ),
    );
  }
}
