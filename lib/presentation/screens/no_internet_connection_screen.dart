import 'package:arm_project/presentation/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/internet/internet_bloc.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        return const BackgroundGradient(
          child: Scaffold(
            body: Center(
              child: Text('No Internet Connection'),
            ),
          ),
        );
      },
    );
  }
}
