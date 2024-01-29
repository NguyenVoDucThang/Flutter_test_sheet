import 'package:flutter/material.dart';
import 'package:flutter_test_sheet/presentation/view/home.dart';

class MyRouter {
  static const String home = '/home';

  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const HomeScreen(),
        );
      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }

  static void onRouteChanged(String screenName) {
    if (<String?>['', null].contains(screenName)) {
      return;
    }
  }
}
