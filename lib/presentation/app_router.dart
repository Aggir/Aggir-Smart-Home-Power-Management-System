import 'package:arm_project/presentation/screens/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'resources/app_strings.dart';
import 'screens/home/home_screen.dart';

class Routes {
  static const String homeRoute = "/";
  static const String historyRoute = "/history";
}

class RouteGenerator {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.historyRoute:
        return MaterialPageRoute(
            builder: (context) => const HistoryScreen(), settings: settings);

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
