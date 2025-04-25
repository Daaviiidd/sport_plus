import 'package:flutter/material.dart';

class EmotionLogScreen extends StatefulWidget {
  const EmotionLogScreen({super.key});

  @override
  _EmotionLogScreenState createState() => _EmotionLogScreenState();
}

class _EmotionLogScreenState extends State<EmotionLogScreen> {
  final TextEditingController _emotionController = TextEditingController();
  final List<String> _emotionEntries = [];

  void _addEmotion() {
    setState(() {
      if (_emotionController.text.isNotEmpty) {
        _emotionEntries.add(_emotionController.text);
        _emotionController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Emocional'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '¿Cómo te sientes hoy?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emotionController,
              decoration: const InputDecoration(
                hintText: 'Escribe tu emoción...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Guardar Emoción'),
              onPressed: _addEmotion,
            ),
            const SizedBox(height: 30),
            const Text(
              'Tu Diario Emocional',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _emotionEntries.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.sentiment_satisfied_alt),
                      title: Text(_emotionEntries[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
