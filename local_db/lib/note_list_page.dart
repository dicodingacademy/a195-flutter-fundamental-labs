import 'package:flutter/material.dart';
import 'package:local_db/db_provider.dart';
import 'package:local_db/note_add_update_page.dart';
import 'package:provider/provider.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Consumer<DbProvider>(
        builder: (_, provider, child) {
          final notes = provider.notes;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (_, index) {
              final note = notes[index];
              return Dismissible(
                key: Key(note.id.toString()),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  provider.deleteNote(note.id!);
                },
                child: Card(
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),
                    onTap: () async {
                      final navigator =  Navigator.of(context);
                      
                      final selectedNote = await provider.getNoteById(note.id!);

                      navigator.push(
                        MaterialPageRoute(
                          builder: (context) {
                            return NoteAddUpdatePage(
                              note: selectedNote,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NoteAddUpdatePage()));
        },
      ),
    );
  }
}
