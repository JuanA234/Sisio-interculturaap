import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/photo_screen.dart';
import 'screens/audio_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sisio interculturaap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/photo': (context) => const PhotoScreen(),
        '/audio': (context) => const AudioScreen(),
      },
    );
  }
}
