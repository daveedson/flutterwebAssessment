import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:new_web_assesment/features/authentication/presentation/login_view.dart';
import 'package:new_web_assesment/features/home/presentation/home_view.dart';
import 'package:new_web_assesment/not_found_screen.dart';

enum AppRoute {
  signIn,
  home,
}

final goRouterProvider = Provider<GoRouter>((ref) {
 
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
     GoRoute(
          path: "/",
          name: 'AppRoute.signIn.name',
          builder: (context, state) => const HomeView(),
        ),
            GoRoute(
          path: "/home",
          name: AppRoute.home.name,
          builder: (context, state) => const HomeView(),
        ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
