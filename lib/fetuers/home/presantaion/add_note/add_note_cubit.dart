import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  static get(context) => BlocProvider.of<AddNoteCubit>(context);

  // NoteModel? note;
  void SelectColor({required Color colorselected}) =>
      emit(SelecteColor(ColorSelected: colorselected));
}
