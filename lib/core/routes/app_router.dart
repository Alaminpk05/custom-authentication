import 'package:authentication/core/constant/const_string.dart';
import 'package:authentication/core/routes/route_names.dart';
import 'package:authentication/features/authentication/screens/forget_password.dart';
import 'package:authentication/features/bottom_nav_bar/screen/bottom_nav_bar.dart';
import 'package:authentication/features/home/home.dart';
import 'package:authentication/features/settings/screens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePath.login,
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = FirebaseAuth.instance.currentUser != null;
      final String location = state.matchedLocation;

      if (!loggedIn &&
          location != RoutePath.login &&
          location != RoutePath.signUp &&
          location != RoutePath.forget) {
        return RoutePath.login;
      }

      if (loggedIn &&
          (location == RoutePath.login || location == RoutePath.signUp)) {
        return RoutePath.home;
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      FirebaseAuth.instance.authStateChanges(),
    ),
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomNavBarScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                  path: RoutePath.home,
                  name: RouteName.home,
                  builder: (context, state) => const HomeScreen())
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: RoutePath.settings,
                  name: RouteName.settings,
                  builder: (context, state) => const SettingsScreen())
            ]),
          ]),
      GoRoute(
        name: RoutePath.login,
        path: RoutePath.login,
       
      ),
      GoRoute(
        name: RouteName.signUp,
        path: RoutePath.signUp,
       
      ),
      GoRoute(
          name: RouteName.forget,
          path: RoutePath.forget,
          builder: (context, state) {
            final String? type = state.extra as String?;
            return ForgetPasswordPage(
              type: type ?? forgetPge,
            );
          }),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<User?> authStateChanges) {
    authStateChanges.listen((_) => notifyListeners());
  }
}
