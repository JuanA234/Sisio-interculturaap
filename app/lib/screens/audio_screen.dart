import 'package:flutter/material.dart';

/// Pantalla para grabar audio y enviar al backend
/// Implementación completa en US-16
class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificar por Sonido'),
      ),
      body: const Center(
        child: Text('Pantalla de grabación de audio - Implementación en US-16'),
      ),
    );
  }
}
