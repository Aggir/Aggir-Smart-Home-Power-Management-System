import 'package:arm_project/presentation/app_router.dart';
import 'package:arm_project/presentation/screens/no_internet_connection.dart';
import 'package:arm_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/blocs/internet/internet_bloc.dart';
import 'resources/themes/app_theme_light.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal({Key? key}) : super(key: key);

  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: kAppName,
        debugShowCheckedModeBanner: false,
        theme: appThemeLight(),
        onGenerateRoute: RouteGenerator().generateRoute,
        builder: (context, child) => BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is ConnectedState) {
              return child!;
            } else {
              return const NoInternetConnectionScreen();
            }
          },
        ),
      ),
    );
  }
}
