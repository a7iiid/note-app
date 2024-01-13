import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/presentaition/lang/lang_state.dart';

import '../../servise/helpar/cash_helpar.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(InitialStat() as LangState);

  static get(context) => BlocProvider.of<LangCubit>(context);
  bool isChick = false;

  void changeLang(bool lang) {
    if (lang != null) {
      isChick = lang;
      CachHelper.putData('isChick', isChick);
      print('not null ${CachHelper.boolgetData('isChick')}');
      emit(Languegchang());
    } else {
      print(' null $lang');

      isChick = !isChick;

      CachHelper.putData('isChick', isChick)
          .then((value) => emit(Languegchang()));
    }
  }
}
