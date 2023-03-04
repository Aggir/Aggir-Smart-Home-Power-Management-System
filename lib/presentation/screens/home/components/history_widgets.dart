import 'package:arm_project/data/models/week_history_model.dart';
import 'package:arm_project/logic/cubits/home/home_cubit.dart';
import 'package:arm_project/presentation/app_router.dart';
import 'package:arm_project/presentation/resources/app_values.dart';
import 'package:arm_project/presentation/resources/themes/app_colors.dart';
import 'package:arm_project/presentation/resources/themes/decorations.dart';
import 'package:arm_project/presentation/screens/home/components/custom_chart.dart';
import 'package:arm_project/presentation/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_strings.dart';

class HistoryWidgets extends StatelessWidget {
  const HistoryWidgets(this.state, {super.key});
  final HomeSuccess state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(text: AppStrings.history),
          const SizedBox(height: AppSize.s10),
          _historyCardWidget(context),
        ],
      ),
    );
  }

  Widget _historyCardWidget(BuildContext context) {
    final WeekHistoryModel weekHistoryModel =
        BlocProvider.of<HomeCubit>(context).getWeekHistory(state.historyData);
    int powerCuts = weekHistoryModel.totalPowerCuts;
    int totalMinutes = weekHistoryModel.totalCutMinutes;
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppDecorations.dropShadow,
        borderRadius: BorderRadius.circular(AppSize.s30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomChart(
              weekValuesMap: weekHistoryModel.weekData,
              color: AppColors.pattensBlue,
              selectedColor: AppColors.primary,
              title: AppStrings.thisWeek,
            ),
            const SizedBox(height: AppSize.s4),
            Text('${AppStrings.totalPowerCuts}: $powerCuts'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${AppStrings.totalMinutes}: $totalMinutes'),
                TextButton(
                    onPressed: () {
                      _showMoreButton(context);
                    },
                    child: const Text(AppStrings.showMore))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMoreButton(BuildContext context) {

    Navigator.of(context)
        .pushNamed(Routes.historyRoute, arguments: state.historyData);
  }
}
