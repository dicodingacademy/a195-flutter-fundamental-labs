import 'package:flutter/foundation.dart';
import 'package:local_db/database_service.dart';
import 'package:local_db/note.dart';

class DbProvider extends ChangeNotifier {
  List<Note> _notes = [];
  DatabaseHelper _dbHelper;

  List<Note> get notes => _notes;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    getAllNotes();
  }

  Future<void> addNote(Note note) async {
    await _dbHelper.insertNote(note);
    getAllNotes();
    notifyListeners();
  }

  void getAllNotes() async {
    _notes = await _dbHelper.getNotes();
    notifyListeners();
  }

  Future<Note> openNote(int id) async {
    return await _dbHelper.getNoteById(id);
  }

  void updateNote(Note note) async {
    await _dbHelper.updateNote(note);
    getAllNotes();
    notifyListeners();
  }

  void deleteNote(int id) async {
    await _dbHelper.deleteNote(id);
    getAllNotes();
    notifyListeners();
  }
}
