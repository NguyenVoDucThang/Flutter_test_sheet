import 'package:flutter/material.dart';
import 'package:flutter_test_sheet/presentation/history_screen/history_screen.dart';
import 'package:flutter_test_sheet/presentation/home_screen/home.dart';

class MyRouter {
  static const String home = '/home';
  static const String historyScreen = '/historyScreen';

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
      case historyScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const HistoryScreen(),
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
