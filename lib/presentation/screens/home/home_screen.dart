import 'package:arm_project/presentation/resources/app_strings.dart';
import 'package:arm_project/presentation/resources/app_values.dart';
import 'package:arm_project/presentation/resources/assets_manager.dart';
import 'package:arm_project/presentation/screens/home/components/electricity_details.dart';
import 'package:arm_project/presentation/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../logic/cubits/home/home_cubit.dart';
import 'components/history_widgets.dart';
import 'components/devices_widgets.dart';
import 'components/overview_widgets.dart';

part 'components/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
      child: Scaffold(
        appBar: _appBar(context),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return ListView(
                children: [
                  ElectricityDetails(state),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p16),
                    child: Wrap(
                      spacing: AppSize.s10,
                      direction: Axis.vertical,
                      children: [
                        OverviewWidgets(state),
                        DevicesWidgets(state),
                        HistoryWidgets(),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text(AppStrings.genericError));
            }
          },
        ),
      ),
    );
  }

  void notificationButton() {}
}
