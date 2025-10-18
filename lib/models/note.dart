// lib/models/note.dart
import 'package:flutter/material.dart';

class Note {
  final Key id;
  final int number;
  final String description;

  Note({required this.number, required this.description}) : id = UniqueKey();
}
