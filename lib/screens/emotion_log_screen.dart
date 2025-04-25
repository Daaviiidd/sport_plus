import 'package:flutter/material.dart';

class EmotionLogScreen extends StatefulWidget {
  const EmotionLogScreen({super.key});

  @override
  State<EmotionLogScreen> createState() => _EmotionLogScreenState();
}

class _EmotionLogScreenState extends State<EmotionLogScreen> {
  final TextEditingController moodController = TextEditingController();

  void saveMood() {
    final mood = moodController.text;
    if (mood.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Estado registrado: $mood')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro Emocional')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('¿Cómo te sientes hoy?', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            TextField(
              controller: moodController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escribe tu estado emocional...',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Guardar'),
              onPressed: saveMood,
            ),
          ],
        ),
      ),
    );
  }
}
