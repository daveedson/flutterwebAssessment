import 'package:flutter/material.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData getLight(
      {Color primaryColor = PrimaryColorsOne.primaryOne600}) {
    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: SecondaryColors.secondary600,
        error: ErrorColors.error600,
      ),
      // appBarTheme: AppBarTheme(
      //   backgroundColor: primaryColor,
      //   elevation: 1,
      //   iconTheme: const IconThemeData(
      //     color: PrimaryColorsOne.primaryOne600,
      //   ),
      //   titleTextStyle: AppTextStyles.heading04SemiBold,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      // ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
