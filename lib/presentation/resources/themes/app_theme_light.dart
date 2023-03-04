import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_values.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'app_colors.dart';

ThemeData appThemeLight() => ThemeData(
      fontFamily: FontConstants.fontFamily,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.transparent,
      colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
          ),
      appBarTheme: AppBarTheme(
        // systemOverlayStyle:
        //     SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
        actionsIconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.primary,
        elevation: AppSize.s2,
        titleTextStyle:
            getSemiBoldStyle(color: AppColors.white, fontSize: FontSize.s26),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              foregroundColor: AppColors.white, iconSize: 28)),
      textTheme: TextTheme(
        displaySmall:
            getBoldStyle(color: AppColors.white, fontSize: FontSize.s28),
        headlineMedium:
            getSemiBoldStyle(color: AppColors.white, fontSize: FontSize.s26),
        titleLarge:
            getSemiBoldStyle(color: AppColors.black, fontSize: FontSize.s20),
        titleMedium:
            getSemiBoldStyle(color: AppColors.white, fontSize: FontSize.s16),
        titleSmall: getSemiBoldStyle(
            color: AppColors.whiteWithOpacity50, fontSize: FontSize.s14),
        labelLarge:
            getMediumStyle(color: AppColors.black, fontSize: FontSize.s18),
        labelMedium:
            getSemiBoldStyle(color: AppColors.black, fontSize: FontSize.s14),
        labelSmall: getRegularStyle(
            color: AppColors.blackWithOpacity50, fontSize: FontSize.s12),
        bodyMedium:
            getRegularStyle(color: AppColors.black, fontSize: FontSize.s14),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        elevation: AppSize.s5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s10),
            topRight: Radius.circular(AppSize.s10),
          ),
        ),
      ),
    );
