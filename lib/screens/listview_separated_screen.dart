// lib/screens/listview_separated_screen.dart
import 'package:flutter/material.dart';
import '../models/note.dart';

class ListViewSeparatedScreen extends StatelessWidget {
  final List<Note> notes;
  final VoidCallback onAddNote;
  final Function(Key) onRemoveNote;

  const ListViewSeparatedScreen({
    super.key,
    required this.notes,
    required this.onAddNote,
    required this.onRemoveNote,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.separated'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: onAddNote),
        ],
      ),
      body: ListView.separated(
        itemCount: notes.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final note = notes[index];
          return GestureDetector(
            onTap: () => onRemoveNote(note.id),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                leading: Text('${note.number}'),
                title: Text(note.description),
              ),
            ),
          );
        },
      ),
    );
  }
}
