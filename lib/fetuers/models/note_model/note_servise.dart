import 'package:hive/hive.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';

class NoteServise {
  static get(context) => NoteServise();
  final String _boxname = 'notetable';
  Future<Box<NoteModel>> get _box async =>
      await Hive.openBox<NoteModel>(_boxname);

  Future<void> addItem(NoteModel note) async {
    var box = await _box;
    box.add(note);
  }

  Future<List<NoteModel>> getAllNote() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteNote(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  Future<void> ubdatIsCombleted(int index, NoteModel note) async {
    var box = await _box;
    await box.putAt(index, note);
  }
}
