import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../../../resources/app_strings.dart';
import '../../../resources/app_values.dart';
import '../../../resources/themes/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({required this.value, required this.function, super.key});
  final bool value;
  final void Function(bool value) function;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late final ValueNotifier<bool> controller;
  @override
  void initState() {
    controller = ValueNotifier<bool>(widget.value);
    controller.addListener(() {
      widget.function(controller.value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: controller,
      activeColor: AppColors.pattensBlue,
      inactiveColor: AppColors.lightGrey,
      thumb: Container(
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppSize.s100)),
      ),
      activeChild: const Text(AppStrings.stateOn),
      inactiveChild: const Text(AppStrings.stateOff),
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s15)),
      width: AppSize.s50,
      height: AppSize.s25,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
