part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class SelecteColor extends AddNoteState {
  final Color ColorSelected;
  SelecteColor({required this.ColorSelected});
}
