import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/fetuers/home/data/repo/home_repo.dart';
import 'package:note_app/fetuers/home/data/repo/home_repo_implemant.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final HomeRepo homeRepo;

  NoteCubit(this.homeRepo) : super(NoteInitial());
  static get(context) => BlocProvider.of<NoteCubit>(context);
  Future<void> getNote() async {
    emit(NoteLoading());
    var result = await homeRepo.fetchNote();
    result.fold((filuer) {
      emit(NoteFiluer());
    }, (notes) {
      emit(NoteSuccess());
    });
  }
}
