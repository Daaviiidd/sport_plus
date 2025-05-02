import 'package:flutter/material.dart';

class EmotionLogScreen extends StatefulWidget {
  const EmotionLogScreen({super.key});

  @override
  State<EmotionLogScreen> createState() => _EmotionLogScreenState();
}

class _EmotionLogScreenState extends State<EmotionLogScreen> {
  String? selectedEmotion;
  final TextEditingController diaryController = TextEditingController();

  final emotions = [
    {'emoji': '😊', 'label': 'Feliz'},
    {'emoji': '😔', 'label': 'Triste'},
    {'emoji': '😡', 'label': 'Enojado'},
    {'emoji': '😰', 'label': 'Ansioso'},
    {'emoji': '😎', 'label': 'Motivado'},
  ];

  void _saveEntry() {
    if (selectedEmotion == null || diaryController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    // Simulación de guardado
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Entrada emocional guardada')),
    );

    setState(() {
      selectedEmotion = null;
      diaryController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('Registro Emocional'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              '¿Cómo te sientes hoy?',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: emotions.map((emotion) {
                final isSelected = selectedEmotion == emotion['label'];
                return GestureDetector(
                  onTap: () => setState(() {
                    selectedEmotion = emotion['label']!;
                  }),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.tealAccent[700]
                          : Colors.blueGrey[700],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        emotion['emoji']!,
                        style: const TextStyle(fontSize: 36),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: diaryController,
              style: const TextStyle(color: Colors.white),
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Escribe sobre tu día...',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.blueGrey[700],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _saveEntry,
              icon: const Icon(Icons.save),
              label: const Text('Guardar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent[700],
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
