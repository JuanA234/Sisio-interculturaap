import 'package:flutter/material.dart';

/// Pantalla para capturar/seleccionar foto y enviar al backend
/// Implementación completa en US-15
class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificar por Foto'),
      ),
      body: const Center(
        child: Text('Pantalla de captura de foto - Implementación en US-15'),
      ),
    );
  }
}
