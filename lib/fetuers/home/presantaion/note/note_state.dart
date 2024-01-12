part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteLoading extends NoteState {}

final class NoteSuccess extends NoteState {
  List<NoteModel> note;
  NoteSuccess({required this.note});
}

final class NoteFailure extends NoteState {
  Widget error;
  NoteFailure({required this.error});
}

final class NoteNull extends NoteState {
  Widget notenull;

  NoteNull({required this.notenull});
}

final class ChangNoteCategory extends NoteState {}

final class Notedelete extends NoteState {}
