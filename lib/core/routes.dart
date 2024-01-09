import 'package:go_router/go_router.dart';
import 'package:note_app/fetuers/home/home_view.dart';

const String khomeview = '/home';

final GoRouter routes = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: khomeview,
    builder: (context, GoRouterState state) {
      return const HomeView();
    },
  )
]);
