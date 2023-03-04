import 'package:arm_project/logic/cubits/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

import '../../../../utils/functions.dart';
import '../../../resources/app_strings.dart';
import '../../../resources/app_values.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/themes/app_colors.dart';

class ElectricityDetails extends StatelessWidget {
  const ElectricityDetails(this.state, {super.key});
  final HomeSuccess state;
  @override
  Widget build(BuildContext context) {
    final String dateTime = DateFormat('yyyy/MM/dd - hh:mm a')
        .format(state.electricityData.lastPowerCut);
    final String electricityState = getState(state.electricityData.state);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.s50),
          bottomRight: Radius.circular(AppSize.s50),
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(1, 1),
              blurRadius: 5,
              color: AppColors.blackWithOpacity25)
        ],
      ),
      height: AppSize.s200,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.electricalEnergy,
              height: AppSize.s100,
              width: AppSize.s100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${AppStrings.electricity}: $electricityState',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(
                  width: AppSize.s10,
                ),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: state.electricityData.state
                      ? AppColors.green
                      : AppColors.red,
                ),
              ],
            ),
            Column(
              children: [
                Text('${AppStrings.lastPowerCut}: $dateTime',
                    style: Theme.of(context).textTheme.titleMedium),
                Text(timeago.format(state.electricityData.lastPowerCut),
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ]),
    );
  }
}
