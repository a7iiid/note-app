import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/BlocObserver.dart';
import 'package:note_app/core/constant/constant.dart';
import 'package:note_app/core/routes.dart';
import 'package:note_app/core/them.dart';
import 'package:note_app/fetuers/home/presantaion/cubit/note_cubit.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const Think());
}

class Think extends StatelessWidget {
  const Think({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(homerepo)..getNote(),
      child: MaterialApp.router(
        themeMode: ThemeMode.dark,
        theme: ThemeApp.themeapp,
        debugShowCheckedModeBanner: false,
        routerConfig: routes,
      ),
    );
  }
}
