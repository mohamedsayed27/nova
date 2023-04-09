
import 'package:flutter/material.dart';
import 'package:nova/core/app_router/screen_names.dart';
import 'package:nova/presentation/screens/login_screen.dart';

import '../../presentation/screens/main_layout.dart';
import '../../presentation/screens/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.splashScreen:
          return MaterialPageRoute(builder: (BuildContext context) {
            return const SplashScreen();
          });
        case ScreenName.login:
          return MaterialPageRoute(builder: (BuildContext context) {
            return const LoginScreen();
          });
        case ScreenName.mainLayout:
          return MaterialPageRoute(builder: (BuildContext context) {
            return const MainLayout();
          });

        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 190),
          reverseTransitionDuration: const Duration(milliseconds: 190),
        );
}
