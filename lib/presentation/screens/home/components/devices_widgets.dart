import 'package:arm_project/data/dataproviders/firebase_dataprovider.dart';
import 'package:arm_project/logic/cubits/home/home_cubit.dart';
import 'package:arm_project/presentation/resources/app_values.dart';
import 'package:arm_project/presentation/resources/assets_manager.dart';
import 'package:arm_project/presentation/resources/themes/app_colors.dart';
import 'package:arm_project/presentation/resources/themes/decorations.dart';
import 'package:arm_project/presentation/resources/themes/styles_manager.dart';
import 'package:arm_project/presentation/screens/home/components/custom_switch.dart';
import 'package:arm_project/presentation/screens/home/components/section_title.dart';
import 'package:arm_project/presentation/widgets/custom_bottom_sheet.dart';
import 'package:arm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants.dart';
import '../../../resources/app_strings.dart';
import 'custom_switch_listtile.dart';

class DevicesWidgets extends StatelessWidget {
  const DevicesWidgets(this.state, {super.key});
  final HomeSuccess state;

  @override
  Widget build(BuildContext context) {
    //todo: fetch data from firestore
    final List<Map<String, dynamic>> devices = [
      {
        'title': AppStrings.testLed,
        'color': AppColors.secondary,
        'state': state.deviceData.state,
        'image': ImageAssets.whiteLed,
        'onTap': () {
          _led1Function(context);
        }
      },
      {
        'title': '${AppStrings.testLed}2',
        'color': AppColors.mauve,
        'state': false,
        'image': ImageAssets.whiteLed,
        'onTap': null
      },
      {
        'title': '${AppStrings.testLed}3',
        'color': AppColors.lightYellow,
        'state': false,
        'image': ImageAssets.yellowLed,
        'onTap': null
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: SectionTitle(text: AppStrings.devices),
        ),
        const SizedBox(height: AppSize.s10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: AppSize.s124,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: devices.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(
                      right: index != devices.length - 1
                          ? AppPadding.p10
                          : AppPadding.p0),
                  child: _deviceCardWidget(
                    context: context,
                    title: devices[index]['title'],
                    state: devices[index]['state'],
                    color: devices[index]['color'],
                    image: devices[index]['image'],
                    onTap: devices[index]['onTap'],
                  ));
            },
          ),
        )
      ],
    );
  }

  Widget _deviceCardWidget({
    required BuildContext context,
    required String title,
    required bool state,
    required Color color,
    required String image,
    void Function()? onTap,
  }) {
    const double cardWidth = AppSize.s120;
    const double cardHeight = AppSize.s120;
    final BorderRadius borderRadius = BorderRadius.circular(AppSize.s25);

    return Stack(
      children: [
        // content
        Ink(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: AppDecorations.dropShadow,
          ),
          width: cardWidth,
          height: cardHeight,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Material(
              color: AppColors.white,
              child: InkWell(
                radius: AppSize.s25,
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: AppSize.s25,
                          backgroundColor: color,
                          child: Image.asset(
                            image,
                            width: AppSize.s30,
                            height: AppSize.s30,
                          ),
                        ),
                        Text(state ? AppStrings.stateOn : AppStrings.stateOff,
                            style: Theme.of(context).textTheme.labelSmall),
                        Text(title,
                            style: Theme.of(context).textTheme.labelMedium)
                      ]),
                ),
              ),
            ),
          ),
        ),
        // disabled button function
        if (onTap == null)
          Container(
            width: cardWidth,
            height: cardHeight,
            decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: AppColors.blackWithOpacity15),
          ),
      ],
    );
  }

  //todo: change to dynamic function
  void _led1Function(BuildContext context) async {
    var data = state.deviceData;
    _showBottomSheet(
      context: context,
      name: AppStrings.testLed,
      electricity: data.electricity,
      generator: data.generator,
    );
  }

  void _showBottomSheet({
    required BuildContext context,
    required String name,
    required bool electricity,
    required bool generator,
  }) {
    CustomBottomSheet.open(
        context: context,
        children: [
          Text(
            '${AppStrings.automaticSwitch}:',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          CustomSwitchListTile(
              title: AppStrings.electricity,
              value: electricity,
              function: (value) {
                BlocProvider.of<HomeCubit>(context)
                    .changeLed1ElectricityAutoStart(value);
              }),
          CustomSwitchListTile(
              title: AppStrings.generator,
              value: generator,
              function: (value) {
                BlocProvider.of<HomeCubit>(context)
                    .changeLed1GeneratorAutoStart(value);
              }),
        ],
        titleText: name);
  }
}
