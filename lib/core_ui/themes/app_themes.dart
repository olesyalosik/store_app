import 'package:flutter/material.dart';
import 'package:store_app/core_ui/colors/app_colors.dart';
import 'package:store_app/core_ui/text_styles/app_text_styles.dart';

class AppThemes {
  static ThemeData get dark => ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
    primaryColor: AppColors.primaryColorDark,
    colorScheme: ColorScheme.dark(error: AppColors.errorColorDark),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColorDark,
    ),
    brightness: Brightness.dark,
    primaryTextTheme: TextTheme(
      bodySmall: AppTextStyles.bodyTextSmallDark,
      bodyMedium: AppTextStyles.bodyTextMediumDark,
      bodyLarge: AppTextStyles.bodyTextLargeDark,
    ),
  );

  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
    primaryColor: AppColors.primaryColorLight,
    colorScheme: ColorScheme.light(error: AppColors.errorColorLight),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColorLight,
    ),
    brightness: Brightness.light,
    primaryTextTheme: TextTheme(
      bodySmall: AppTextStyles.bodyTextSmallLight,
      bodyMedium: AppTextStyles.bodyTextMediumLight,
      bodyLarge: AppTextStyles.bodyTextLargeLight,
    ),
  );
}
