import 'package:go_router/go_router.dart';
import 'package:note_app/fetuers/auth/login.dart';
import 'package:note_app/fetuers/auth/signup.dart';
import 'package:note_app/fetuers/home/add_note_form.dart';
import 'package:note_app/fetuers/home/edit_note.dart';
import 'package:note_app/fetuers/home/home_view.dart';
import 'package:note_app/fetuers/splash/splash.dart';

const String khomeview = '/home';
const String kaddnoteview = '/addnote';
const String keditnote = '/editnote';
const String klogin = '/login';
const String ksignup = '/signup';

final GoRouter routes = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, GoRouterState state) {
      return const SplashView();
    },
  ),
  GoRoute(
    path: klogin,
    builder: (context, GoRouterState state) {
      return const log_in();
    },
  ),
  GoRoute(
    path: ksignup,
    builder: (context, GoRouterState state) {
      return const signup();
    },
  ),
  GoRoute(
    path: khomeview,
    builder: (context, GoRouterState state) {
      return const HomeView();
    },
  ),
  GoRoute(
    path: kaddnoteview,
    builder: (context, GoRouterState state) {
      return AddNoteForm();
    },
  ),
  GoRoute(
    path: keditnote,
    builder: (context, GoRouterState state) {
      final id = state.extra as int?;
      if (id == null) {
        return AddNoteForm();
      }
      return EditNoteView(id: id!);
    },
  ),
]);
