import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:note_app/fetuers/home/data/repo/home_repo.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';
import 'package:note_app/fetuers/models/note_model/note_servise.dart';

class HomeRepoImplemant implements HomeRepo {
  @override
  Future<Either<Widget, List<NoteModel>>> fetchNote() async {
    try {
      List<NoteModel> notes = await NoteServise().getAllNote();
      return right(notes);
    } on Exception catch (e) {
      // TOD
      return left(const Center(
        child: Text("has Error"),
      ));
    }
  }
}
