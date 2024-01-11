import 'package:flutter/material.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Widget, List<NoteModel>>> fetchNote();
}
