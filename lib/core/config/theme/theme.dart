import 'package:eatery/core/constants/app_colors.dart';
import 'package:eatery/core/constants/app_font.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  primarySwatch: Colors.amber,
  drawerTheme: const DrawerThemeData(backgroundColor: AppColors.white),
  iconTheme: const IconThemeData(color: AppColors.white),
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: AppFont.fontTitle,
        fontWeight: AppFont.fontWeightTitle,
      )),
  dividerColor: AppColors.lightGray,
  listTileTheme: const ListTileThemeData(iconColor: AppColors.black),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.black,
      fontSize: AppFont.fontBody,
      fontWeight: AppFont.fontWeightBody,
    ),
    labelSmall: TextStyle(
      color: AppColors.black,
      fontSize: AppFont.fontLableSmall,
      fontWeight: AppFont.fontWeightLable,
    ),
    labelMedium: TextStyle(
      color: AppColors.black,
      fontSize: AppFont.fontLableMedium,
      fontWeight: AppFont.fontWeightLable,
    ),
    labelLarge: TextStyle(
      color: AppColors.black,
      fontSize: AppFont.fontLableLarge,
      fontWeight: AppFont.fontWeightLable,
    ),
    displayMedium: TextStyle(
      color: AppColors.white,
      fontSize: AppFont.fontLableMedium,
      fontWeight: AppFont.fontWeightLable,
    ),
    displayLarge: TextStyle(
      color: AppColors.white,
      fontSize: AppFont.fontLableLarge,
      fontWeight: AppFont.fontWeightLable,
    ),
    headlineMedium: TextStyle(
      color: AppColors.orange,
      fontSize: AppFont.fontLableMedium,
      fontWeight: AppFont.fontWeightLable,
    ),
    titleMedium: TextStyle(
      color: AppColors.lightGray,
      fontSize: AppFont.fontLableMedium,
      fontWeight: AppFont.fontWeightLable,
    ),
    titleLarge: TextStyle(
      color: AppColors.black,
      fontSize: AppFont.fontLableMedium,
      fontWeight: AppFont.fontWeightLable,
    ),
  ),
);
