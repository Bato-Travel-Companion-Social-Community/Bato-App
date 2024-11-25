import 'package:go_router/go_router.dart';
import 'static/index.dart' show routes;

/// A function that creates and returns a [GoRouter] instance.
///
/// The [MainGoRouter] function initializes a [GoRouter] with a specified
/// initial location and a list of routes.
///
/// The initial location is set to the root path ('/') by default, which typically
/// corresponds to the splash page.
///
/// The [routes] are imported from 'static/routes.dart' and define the navigation
/// structure of the application.
GoRouter MainGoRouter() {
  return GoRouter(
    initialLocation: '/', // Start at splash page
    routes: routes,
  );
}
