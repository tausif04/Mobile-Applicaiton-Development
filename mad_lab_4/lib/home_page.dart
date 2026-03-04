import 'package:flutter/material.dart';
import 'package:mad_lab_5/nav_drawer.dart';
import 'package:mad_lab_5/create_personal_note.dart';
import 'package:mad_lab_5/create_study_note.dart';
import 'package:mad_lab_5/view_note.dart';

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
      drawer: const NavDrawer(),

      /// FLOATING ACTION BUTTON
      floatingActionButton: Padding(
        padding: EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CreateStudyNotePage(),
                  ),
                );
              },
              heroTag: 'btn1',
              icon: const Icon(Icons.create),
              label: const Text('Study Note'),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CreatePersonalNotePage(),
                  ),
                );
              },
              heroTag: 'btn2',
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
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const CreateStudyNotePage(),
                                        ),
                                      );
                                    },
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
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const CreatePersonalNotePage(),
                                        ),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ViewNotesPage(),
                              ),
                            );
                          },
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
