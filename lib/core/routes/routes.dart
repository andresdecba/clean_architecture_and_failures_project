import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tmdb_challenge/movies/presentation/pages/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const homeScreen = 'homeScreen';

  static final appRoutes = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
