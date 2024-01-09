import 'package:go_router/go_router.dart';
import 'package:note_app/fetuers/home/home_view.dart';
import 'package:note_app/fetuers/splash/splash.dart';

const String khomeview = '/home';

final GoRouter routes = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, GoRouterState state) {
      return const SplashView();
    },
  ),
  GoRoute(
    path: khomeview,
    builder: (context, GoRouterState state) {
      return const HomeView();
    },
  )
]);
