import 'package:flutter/material.dart';

class CoachPanelScreen extends StatefulWidget {
  const CoachPanelScreen({super.key});

  @override
  State<CoachPanelScreen> createState() => _CoachPanelScreenState();
}

class _CoachPanelScreenState extends State<CoachPanelScreen> {
  final List<String> athletes = ['Carlos Pérez', 'Lucía Gómez', 'David Ruiz'];

  final TextEditingController _newAthleteController = TextEditingController();

  void _addAthlete() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.blueGrey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title:
            const Text('Nuevo Atleta', style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: _newAthleteController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Nombre del atleta',
            hintStyle: const TextStyle(color: Colors.white60),
            filled: true,
            fillColor: Colors.blueGrey[700],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _newAthleteController.clear();
            },
            child: const Text('Cancelar',
                style: TextStyle(color: Colors.redAccent)),
          ),
          TextButton(
            onPressed: () {
              final name = _newAthleteController.text.trim();
              if (name.isNotEmpty) {
                setState(() => athletes.add(name));
                Navigator.pop(context);
                _newAthleteController.clear();
              }
            },
            child: const Text('Añadir',
                style: TextStyle(color: Colors.tealAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('Panel del Entrenador'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add, color: Colors.tealAccent),
            onPressed: _addAthlete,
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: athletes.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.tealAccent[700],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: Text(
                athletes[index],
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
