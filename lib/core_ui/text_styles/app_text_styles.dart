import 'package:flutter/material.dart';
import 'package:store_app/core_ui/colors/app_colors.dart';

class AppTextStyles {
  //dark
  static const TextStyle bodyTextSmallDark = TextStyle(
    color: AppColors.textColorDark,
    fontFamily: 'SourGummy',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodyTextMediumDark = TextStyle(
    color: AppColors.textColorDark,
    fontFamily: 'SourGummy',
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodyTextLargeDark = TextStyle(
    color: AppColors.textColorDark,
    fontFamily: 'SourGummy',
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle selectedLabelStyleDark = TextStyle(
    color: AppColors.primaryColorDark,
    fontFamily: 'SourGummy',
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle unSelectedLabelStyleDark = TextStyle(
    color: AppColors.textColorDark,
    fontFamily: 'SourGummy',
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  //light
  static const TextStyle bodyTextSmallLight = TextStyle(
    color: AppColors.textColorLight,
    fontFamily: 'SourGummy',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodyTextMediumLight = TextStyle(
    color: AppColors.textColorLight,
    fontFamily: 'SourGummy',
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodyTextLargeLight = TextStyle(
    color: AppColors.textColorLight,
    fontFamily: 'SourGummy',
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle selectedLabelStyleLight = TextStyle(
    color: AppColors.primaryColorLight,
    fontFamily: 'SourGummy',
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle unSelectedLabelStyleLight = TextStyle(
    color: AppColors.textColorLight,
    fontFamily: 'SourGummy',
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
}
