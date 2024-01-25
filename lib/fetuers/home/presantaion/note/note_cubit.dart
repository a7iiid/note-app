import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/core/constant/constant.dart';
import 'package:note_app/core/widget/note_null.dart';
import 'package:note_app/fetuers/home/data/repo/home_repo.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';
import 'package:note_app/fetuers/models/note_model/note_servise.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final HomeRepo homeRepo;

  NoteCubit(this.homeRepo) : super(NoteInitial());

  int categoryselect = 0;
  String categoryitem = "All";
  static get(context) => BlocProvider.of<NoteCubit>(context);

  final List<String> categories = [
    'All',
    'Important',
    'Lecture notes',
    'To-do lists',
    'Shopping'
  ];
  void category(int index) {
    categoryselect = index;
    categoryitem = categories[index];

    emit(ChangNoteCategory());
  }

  Future<void> getNote(int index) async {
    categoryselect = index;

    emit(NoteLoading());
    var result = await homeRepo.fetchNote();
    result.fold((filuer) {
      emit(NoteFailure(error: filuer));
    }, (notes) {
      if (notes == null) {
        emit(NoteNull(notenull: CustomNoteNull()));
      }
      allnote = notes;
      emit(NoteSuccess(
          note: index != 0
              ? notes
                  .where((element) => element.category == categories[index])
                  .toList()
              : notes));
    });
  }

  Future<void> deletenote() async {
    emit(Notedelete());

    await getNote(categoryselect);
  }

  Future<void> addnote(BuildContext context) async {
    NoteModel note = NoteModel(
        category: categories[categoryselect],
        color: colornote,
        title: TitleController.text,
        note: NoteController.text);
    NoteServise.get(context).addItem(note);
    TitleController = TextEditingController();
    NoteController = TextEditingController();
    colornote = ColorApp.ColorNote1;
    await getNote(0);
  }
}
