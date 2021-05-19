import 'package:flutter/foundation.dart';
import 'package:local_db/database_helper.dart';
import 'package:local_db/note.dart';

class DbProvider extends ChangeNotifier {
  List<Note> _notes = [];
  late DatabaseHelper _dbHelper;

  List<Note> get notes => _notes;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllNotes();
  }

  Future<void> addNote(Note note) async {
    await _dbHelper.insertNote(note);
    _getAllNotes();
  }

  void _getAllNotes() async {
    _notes = await _dbHelper.getNotes();
    notifyListeners();
  }

  Future<Note> getNoteById(int id) async {
    return await _dbHelper.getNoteById(id);
  }

  void updateNote(Note note) async {
    await _dbHelper.updateNote(note);
    _getAllNotes();
  }

  void deleteNote(int id) async {
    await _dbHelper.deleteNote(id);
    _getAllNotes();
  }
}
