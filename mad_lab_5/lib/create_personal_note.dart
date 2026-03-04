import 'package:flutter/material.dart';
import '../main.dart';
import '../nav_drawer.dart';

class CreatePersonalNotePage extends StatefulWidget {
  const CreatePersonalNotePage({super.key});

  @override
  State<CreatePersonalNotePage> createState() => _CreatePersonalNotePageState();
}

class _CreatePersonalNotePageState extends State<CreatePersonalNotePage> {
  final TextEditingController _controller = TextEditingController();

  void _saveNote() {
    if (_controller.text.trim().isEmpty) return;

    personalNotes.add(_controller.text.trim());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Create Note')),

      drawer: const NavDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'Write your note here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _saveNote,
                child: const Text('Save Note'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
