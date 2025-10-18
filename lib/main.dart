// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/column_screen.dart';
import 'screens/listview_screen.dart';
import 'screens/listview_separated_screen.dart';
import 'models/note.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  int _currentIndex = 0;
  final List<Note> _notes = [];

  void _addNote() {
    setState(() {
      final nextNumber = _notes.isEmpty ? 1 : _notes.last.number + 1;
      _notes.add(Note(number: nextNumber, description: 'Заметка №$nextNumber'));
    });
  }

  void _removeNote(Key id) {
    setState(() {
      _notes.removeWhere((note) => note.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      NotesColumnScreen(notes: _notes, onAddNote: _addNote, onRemoveNote: _removeNote),
      ListViewScreen(notes: _notes, onAddNote: _addNote, onRemoveNote: _removeNote),
      ListViewSeparatedScreen(notes: _notes, onAddNote: _addNote, onRemoveNote: _removeNote),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotesApp',
      home: Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.view_column), label: 'Column'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView'),
            BottomNavigationBarItem(icon: Icon(Icons.view_stream), label: 'Separated'),
          ],
        ),
      ),
    );
  }
}
