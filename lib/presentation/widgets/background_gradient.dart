import 'package:arm_project/presentation/resources/themes/decorations.dart';
import 'package:flutter/material.dart';

import '../resources/themes/app_colors.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppDecorations.defaultGradient(
          firstColor: AppColors.white,
          secondColor: AppColors.columbiaBlue,
        ),
      ),
      child: child,
    );
  }
}
