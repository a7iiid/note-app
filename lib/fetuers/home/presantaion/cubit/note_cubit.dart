import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/widget/note_null.dart';
import 'package:note_app/fetuers/home/data/repo/home_repo.dart';
import 'package:note_app/fetuers/home/data/repo/home_repo_implemant.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';
import 'package:note_app/fetuers/models/note_model/note_servise.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final HomeRepo homeRepo;

  NoteCubit(this.homeRepo) : super(NoteInitial());

  static get(context) => BlocProvider.of<NoteCubit>(context);
  void changeSelectedCategory() {
    emit(ChangNoteCategory());
  }

  Future<void> getNote() async {
    emit(NoteLoading());
    var result = await homeRepo.fetchNote();
    result.fold((filuer) {
      emit(NoteFailure(error: filuer));
    }, (notes) {
      if (notes != null) {
        emit(NoteSuccess(note: notes));
      }
      emit(NoteNull(notenull: CustomNoteNull()));
    });
  }
}
