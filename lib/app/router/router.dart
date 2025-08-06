import 'package:caloree_app/app/router/routes.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: const HomePageRoute().location,
  debugLogDiagnostics: true,
  routes: $appRoutes,
);
