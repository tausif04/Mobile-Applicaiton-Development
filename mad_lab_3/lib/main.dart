import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final List<String> notes = [];

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
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,

      /// APP BAR
      appBar: AppBar(
        title: Align(alignment: Alignment.centerRight, child: Text('My Notes')),
      ),

      /// NAVIGATION DRAWER
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: colorScheme.primaryContainer),
              child: Text(
                'My Notes',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.create),
              title: const Text('Create Study Note'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateNotePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: const Text('Create Personal Note'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateNotePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {},
            ),
          ],
        ),
      ),

      /// FLOATING ACTION BUTTON
      floatingActionButton: Padding(
        padding: EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.create),
              label: const Text('Study Note'),
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.person_2_outlined),
              label: const Text('Personal Note'),
            ),
          ],
        ),
      ),

      /// BODY
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// HEADLINE
                      Text(
                        'Capture your thoughts',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),

                      const SizedBox(height: 12),

                      /// SUBTEXT
                      Text(
                        'Write, organize, and revisit your ideas anytime — all in one simple and beautiful place.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),

                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 56,
                                  width: 400,
                                  child: ElevatedButton(
                                    onPressed: () {Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const CreateNotePage()),
                                    );},
                                    child: const Text('Create a Study Note'),
                                  ),
                                ),
                                SizedBox(
                                  height: 56,
                                  width: 400,
                                  child: ElevatedButton(
                                    onPressed: () {
                                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const CreateNotePage()),
                                  );
                                    },
                                    child: const Text('Create a Personal Note'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      /// SECONDARY CTA
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton(
                          onPressed: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const ViewNotesPage()),
                                  );},
                          child: const Text('View My Notes'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// FOOTER TEXT
            Text(
              'Designed to help you think clearly and stay organized.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

/// =========================
/// CREATE NOTE PAGE
/// =========================
class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final TextEditingController _controller = TextEditingController();

  void _saveNote() {
    if (_controller.text.trim().isEmpty) return;

    notes.add(_controller.text.trim());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Note')),
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

/// =========================
/// VIEW NOTES PAGE
/// =========================
class ViewNotesPage extends StatefulWidget {
  const ViewNotesPage({super.key});

  @override
  State<ViewNotesPage> createState() => _ViewNotesPageState();
}

class _ViewNotesPageState extends State<ViewNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      body: notes.isEmpty
          ? const Center(child: Text('No notes yet'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(notes[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
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
    );
  }
}