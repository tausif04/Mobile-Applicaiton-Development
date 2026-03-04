import 'package:flutter/material.dart';
import '../main.dart' ;
class ViewNotesPage extends StatefulWidget {
  const ViewNotesPage({super.key});

  @override
  State<ViewNotesPage> createState() => _ViewNotesPageState();
}

class _ViewNotesPageState extends State<ViewNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        color: Colors.grey[50], // Subtle background contrast
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Fixed: Wrapped Column in Expanded to prevent layout assertion error
            Expanded(
              child: _buildNoteColumn(
                'Personal Notes',
                personalNotes,
                Colors.blueAccent,
              ),
            ),
            const SizedBox(width: 24), // Space between columns
            Expanded(
              child: _buildNoteColumn(
                'Study Notes',
                studyNotes,
                Colors.orangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Extracted UI logic to keep the structure clean and readable
  Widget _buildNoteColumn(String title, List<String> notes, Color accentColor) {
    return Column(
      children: [
        Card(
          color: accentColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16),
            ),
            child: notes.isEmpty
                ? Center(
                    child: Text(
                      'No $title yet',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        elevation: 1,
                        child: ListTile(
                          title: Text(notes[index]),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                notes.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
