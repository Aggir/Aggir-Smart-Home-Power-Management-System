import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubits/home/home_cubit.dart';
import 'resources/app_strings.dart';
import 'screens/home/home_screen.dart';

class Routes {
  static const String homeRoute = "/";
}

class RouteGenerator {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => HomeCubit(),
                  child: const HomeScreen(),
                ));
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
