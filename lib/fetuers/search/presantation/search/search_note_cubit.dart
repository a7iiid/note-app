// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constant/constant.dart';

part 'search_note_state.dart';

class SearchNoteCubit extends Cubit<SearchNoteState> {
  SearchNoteCubit() : super(SearchNoteInitial());
  static get(context) => BlocProvider.of<SearchNoteCubit>(context);

  void search(String query) {
    searchfilterd =
        allnote!.where((element) => element.title.contains(query)).toList();
    if (searchfilterd.isNotEmpty && searchfilterd != null) {
      emit(SearchNoteFaindNote());
      print(searchfilterd);
    } else {
      emit(SearchNoteFilure());
    }
  }
}
