// lib/screens/column_screen.dart
import 'package:flutter/material.dart';
import '../models/note.dart';

class NotesColumnScreen extends StatelessWidget {
  final List<Note> notes;
  final VoidCallback onAddNote;
  final Function(Key) onRemoveNote;

  const NotesColumnScreen({
    super.key,
    required this.notes,
    required this.onAddNote,
    required this.onRemoveNote,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column список'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: onAddNote,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: notes
              .map((note) => GestureDetector(
            onTap: () => onRemoveNote(note.id),
            child: Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text('Заметка №${note.number}'),
                subtitle: Text(note.description),
              ),
            ),
          ))
              .toList(),
        ),
      ),
    );
  }
}
