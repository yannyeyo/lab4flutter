// lib/screens/listview_screen.dart
import 'package:flutter/material.dart';
import '../models/note.dart';

class ListViewScreen extends StatelessWidget {
  final List<Note> notes;
  final VoidCallback onAddNote;
  final Function(Key) onRemoveNote;

  const ListViewScreen({
    super.key,
    required this.notes,
    required this.onAddNote,
    required this.onRemoveNote,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: onAddNote),
        ],
      ),
      body: ListView(
        children: notes
            .map((note) => GestureDetector(
          onTap: () => onRemoveNote(note.id),
          child: Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Text('${note.number}'),
              title: Text(note.description),
            ),
          ),
        ))
            .toList(),
      ),
    );
  }
}
