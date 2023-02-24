import 'package:arm_project/presentation/resources/app_values.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppDecorations {
  static List<BoxShadow> dropShadow = [
    BoxShadow(
        offset: const Offset(AppSize.s1, AppSize.s1),
        blurRadius: AppSize.s5,
        color: AppColors.blackWithOpacity25)
  ];

  static LinearGradient defaultGradient({Color? firstColor,Color? secondColor})=> LinearGradient(
    colors: [
      firstColor?? AppColors.ruddyBlue,
      secondColor?? AppColors.cyanBlue,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    stops: const [AppSize.s0, AppSize.s1],
  );
}
