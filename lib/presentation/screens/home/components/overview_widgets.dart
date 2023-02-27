import 'package:arm_project/logic/cubits/home/home_cubit.dart';
import 'package:arm_project/presentation/resources/app_values.dart';
import 'package:arm_project/presentation/resources/assets_manager.dart';
import 'package:arm_project/presentation/resources/themes/decorations.dart';
import 'package:arm_project/presentation/resources/themes/font_manager.dart';
import 'package:arm_project/presentation/resources/themes/styles_manager.dart';
import 'package:arm_project/presentation/screens/home/components/custom_switch.dart';
import 'package:arm_project/presentation/screens/home/components/section_title.dart';
import 'package:arm_project/utils/extensions.dart';
import 'package:arm_project/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../resources/app_strings.dart';
import '../../../resources/themes/app_colors.dart';

class OverviewWidgets extends StatelessWidget {
  const OverviewWidgets(this.state, {super.key});
  final HomeSuccess state;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(text: AppStrings.overview),
          const SizedBox(
            height: AppSize.s10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: GridView.count(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: AppSize.s1,
              crossAxisSpacing: AppSize.s16,
              children: [
                _overviewCardWidget(_generatorCard(context)),
                _overviewCardWidget(_fuelLevelCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _overviewCardWidget(Widget child) {
    return Container(
      height: AppSize.s160,
      width: AppSize.s160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s30),
          gradient: AppDecorations.defaultGradient(),
          boxShadow: AppDecorations.dropShadow),
      padding: const EdgeInsets.all(AppPadding.p16),
      child: child,
    );
  }

  Widget _generatorCard(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImageAssets.generator,
              height: AppSize.s60,
              width: AppSize.s60,
            ),
            CustomSwitch(value: state.generatorData.autoStart, function: (value){
              BlocProvider.of<HomeCubit>(context)
          .changeGeneratorAutoStartValue(value);
            })
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FittedBox(
                child: Text(
                  AppStrings.generator,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Text(
                getState(state.generatorData.state),
                style: getRegularStyle(
                    color: AppColors.whiteWithOpacity50,
                    fontSize: FontSize.s16),
              ),
            ],
          ),
        )
      ],
    );
  }
  Widget _fuelLevelCard() {
    return Container(
      width: AppSize.s140,
      height: AppSize.s140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s100),
      ),
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Stack(
        children: [
          Center(
            child: Text(
              state.generatorData.fuelLevel.getString(),
              style: getExtraBoldStyle(
                  color: AppColors.primary, fontSize: FontSize.s18),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Image.asset(
              ImageAssets.fuel,
              width: AppSize.s30,
              height: AppSize.s30,
            ),
          ),
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                pointers: <GaugePointer>[
                  RangePointer(
                    value: state.generatorData.fuelLevel.getPercentage(),
                    cornerStyle: CornerStyle.bothCurve,
                    color: AppColors.primary,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                  )
                ],
                minimum: AppSize.s0,
                maximum: AppSize.s100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: AppColors.pattensBlue,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
