import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../servise/helpar/cash_helpar.dart';

part 'theem_mode_state.dart';

class TheemModeCubit extends Cubit<TheemModeState> {
  TheemModeCubit() : super(TheemModeInitial());

  static get(context) => BlocProvider.of<TheemModeCubit>(context);

  bool isChick = false;

  void LoadTheem() {
    var chick = CachHelper.boolgetData('isChick');
    if (chick == null) {
      isChick = false;
      CachHelper.putData('isChick', isChick);
    } else {
      isChick = chick;
    }
    emit(TheemModeChange());
  }

  void changemode() {
    isChick = !isChick;

    CachHelper.putData('isChick', isChick)
        .then((value) => emit(TheemModeChange()));
  }
}
