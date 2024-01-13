import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/BlocObserver.dart';
import 'package:note_app/core/constant/constant.dart';
import 'package:note_app/core/presentaition/lang/lang_cubit.dart';
import 'package:note_app/core/presentaition/them_mode/cubit/theem_mode_cubit.dart';
import 'package:note_app/core/routes.dart';
import 'package:note_app/core/them.dart';
import 'package:note_app/fetuers/home/presantaion/add_note/add_note_cubit.dart';
import 'package:note_app/fetuers/home/presantaion/note/note_cubit.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/servise/helpar/cash_helpar.dart';
import 'core/servise/localisation.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(ColorAdapter());

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await CachHelper.init();
  runApp(Think());
}

class Think extends StatelessWidget {
  Think({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NoteCubit(homerepo)..getNote(0)),
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => TheemModeCubit()..LoadTheem()),
      ],
      child: BlocBuilder<TheemModeCubit, TheemModeState>(
        builder: (context, state) {
          return MaterialApp.router(
            //Localization lang

            // supportedLocales: const [Locale('en'), Locale('ar')],
            // localizationsDelegates: const [
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate
            // ],
            // localeResolutionCallback: (deviceLocale, supportedLocales) {
            //   for (var locale in supportedLocales) {
            //     if (deviceLocale != null &&
            //         deviceLocale.languageCode == locale.languageCode) {
            //       return deviceLocale;
            //     }
            //   }

            //   return supportedLocales.first;
            // },
            theme: TheemModeCubit.get(context).isChick
                ? ThemeApp.themeapplight
                : ThemeApp.themeappdark,
            debugShowCheckedModeBanner: false,
            routerConfig: routes,
            builder: (context, child) {
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: TheemModeCubit.get(context).isChick
                      ? Color(0xffF2F2F2)
                      : Color.fromARGB(255, 18, 18, 18),
                  statusBarIconBrightness: TheemModeCubit.get(context).isChick
                      ? Brightness.dark
                      : Brightness.light,
                  statusBarBrightness: TheemModeCubit.get(context).isChick
                      ? Brightness.light
                      : Brightness.dark,
                ),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
