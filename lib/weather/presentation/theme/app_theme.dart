import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfoliome/core/constants/constants.dart';

class AppTheme {
  ThemeData get defaultTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.lightGrey,
        backgroundColor: AppColors.lightGrey,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          color: AppColors.lightGrey,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primary),
          titleTextStyle: AppStyles.headlineMedium,
          titleSpacing: 0,
        ),
        fontFamily: AppStyles.fontFamily,
        // inputDecorationTheme: const InputDecorationTheme(
        //   hintStyle: TextStyle(color: AppColors.darkGrey),
        //   labelStyle: TextStyle(color: AppColors.darkGrey),
        //   errorStyle: TextStyle(color: AppColors.lightRed),
        // ),

        textTheme: const TextTheme(
          // Headlines
          headlineLarge: AppStyles.headlineLarge,
          headlineMedium: AppStyles.headlineMedium,
          headlineSmall: AppStyles.headlineSmall,
          // Titles
          titleLarge: AppStyles.titleLarge,
          titleMedium: AppStyles.titleMedium,
          titleSmall: AppStyles.titleSmall,
          // Labels
          labelLarge: AppStyles.labelLarge,
          labelMedium: AppStyles.labelMedium,
          labelSmall: AppStyles.labelSmall,
          // Bodies
          bodyLarge: AppStyles.bodyLarge,
          bodyMedium: AppStyles.bodyMedium,
          bodySmall: AppStyles.bodySmall,
          // Displays
          displayLarge: AppStyles.displayLarge,
          displayMedium: AppStyles.displayMedium,
          displaySmall: AppStyles.displaySmall,
        ).apply(
          bodyColor: AppColors.darkGrey,
          displayColor: AppColors.darkGrey,
        ),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AppColors.darkGrey,
          labelStyle: AppStyles.bodyLarge,
          unselectedLabelStyle: AppStyles.bodyLarge.copyWith(fontWeight: FontWeight.w400),
          labelPadding: EdgeInsets.zero,
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.lightGrey,
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
            primaryColor: AppColors.darkGrey,
            textStyle: AppStyles.bodyMedium,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.primary, size: 24),
        primaryColor: AppColors.primary,
        brightness: Brightness.light,
        canvasColor: AppColors.grey,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
      );
}
