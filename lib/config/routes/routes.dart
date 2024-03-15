import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/authentication/domain/repositories/auth_repository.dart';
import '../../feature/authentication/presentation/pages/create_account_screen.dart';
import '../../feature/authentication/presentation/pages/forgot_password_screen.dart';
import '../../feature/authentication/presentation/pages/login_screen.dart';
import '../../feature/movie/presentation/pages/home_screen.dart';
import '../../injection_container.dart';

final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: '/login',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: '/',
          name: 'movie',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          }
      ),
      GoRoute(
          path: '/login',
          name: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          }
      ),
      GoRoute(
          path: '/signUp',
          name: 'signUp',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateAccountScreen();
          }
      ),
      GoRoute(
          path: '/forgotPassword',
          name: 'forgotPassword',
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPasswordScreen();
          }
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final isAuthenticated = sl<AuthRepository>().isLoggedIn();

      if (state.fullPath == '/login') {
        return isAuthenticated ? '/' : '/login';
      }

      return null;
    }
);
