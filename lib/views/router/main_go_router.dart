import 'package:go_router/go_router.dart';
import 'static/main.dart' show routes;

GoRouter MainGoRouter() {
  return GoRouter(
    initialLocation: '/', // Start at splash page
    routes: routes,
  );
}
