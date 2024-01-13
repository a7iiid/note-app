part of 'search_note_cubit.dart';

sealed class SearchNoteState {}

final class SearchNoteInitial extends SearchNoteState {}

final class SearchNoteLoading extends SearchNoteState {}

final class SearchNoteFaindNote extends SearchNoteState {}

final class SearchNoteFilure extends SearchNoteState {}
