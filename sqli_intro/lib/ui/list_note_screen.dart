import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqli_intro/models/note.dart';
import 'package:sqli_intro/providers/note_notifier.dart';

class ListNoteScreen extends ConsumerStatefulWidget {
  const ListNoteScreen({super.key});

  @override
  ConsumerState<ListNoteScreen> createState() => _ListNoteScreenState();
}

class _ListNoteScreenState extends ConsumerState<ListNoteScreen> {
  @override
  Widget build(BuildContext context) {
    // ref.watch(provider) -> AsyncValue<List<Note>>
    final notesAsyncValue = ref.watch(noteProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('SQLite Notes Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: // Những thao tác bất đồng bộ: DB, API call... thì có cơ chế loading -> data(ok)/error
        notesAsyncValue.when(
          // fn truền vào nhận 1 param (đang đặt tên biến là notes), kiểu là List<Note> (xem bên trên)
          data: (notes) => notes.isEmpty
              ? Text('There are no notes')
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];

                    return ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.content),
                      trailing: IconButton(
                        onPressed: () {
                          ref.read(noteProvider.notifier).deleteNote(note.id!);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
          error: (err, stack) => Text('There is an error while loading notes'),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(noteProvider.notifier)
              .createNote(Note(title: 'Test notes', content: 'Note content'));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
