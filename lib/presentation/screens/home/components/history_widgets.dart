import 'package:arm_project/logic/cubits/home/home_cubit.dart';
import 'package:arm_project/presentation/resources/app_values.dart';
import 'package:arm_project/presentation/resources/themes/app_colors.dart';
import 'package:arm_project/presentation/resources/themes/decorations.dart';
import 'package:arm_project/presentation/screens/home/components/custom_chart.dart';
import 'package:arm_project/presentation/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_strings.dart';

class HistoryWidgets extends StatelessWidget {
  const HistoryWidgets({super.key});

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
    final List<double?> values = [7, 14, 8, 11, 0, 2];
    const int powerCuts = 4;
    const int totalHours = 42;
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppDecorations.dropShadow,
        borderRadius: BorderRadius.circular(AppSize.s30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomChart(
              weekValues: values,
              color: AppColors.pattensBlue,
              selectedColor: AppColors.primary,
            ),
            const SizedBox(height: AppSize.s4),
            const Text('${AppStrings.totalPowerCuts}: $powerCuts'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('${AppStrings.totalHours}: $totalHours'),
                TextButton(
                    onPressed: () {
                      _showMoreButton(context);
                    },
                    child: Text(AppStrings.showMore))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showMoreButton(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getData();
  }
}
