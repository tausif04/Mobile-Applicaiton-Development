import 'package:flutter/material.dart';
import './home_page.dart';

void main() {
  runApp(const MyApp());
}

final List<String> studyNotes = [];
final List<String> personalNotes = [];

/// ROOT OF THE APPLICATION
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
          bodyLarge: TextStyle(fontSize: 16, height: 1.6),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      home: const HomePage(),
    );
  }
}

/// LANDING PAGE


/// =========================
/// CREATE STUDY NOTE PAGE
/// =========================


/// =========================
/// CREATE PERSONAL NOTE PAGE
/// =========================



  