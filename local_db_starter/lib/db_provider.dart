import 'package:flutter/foundation.dart';
import 'package:local_db/note.dart';

class DbProvider extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;
}
