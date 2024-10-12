import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles.dart';

ThemeData get lightTheme => ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: AppColors.cultured,
        foregroundColor: AppColors.black,
        elevation: 0,
        titleTextStyle: AppTextStyle.body1,
        centerTitle: true,
      ),
      canvasColor: Colors.white,
      scaffoldBackgroundColor: AppColors.cultured,
      fontFamily: 'DMSans',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ).copyWith(surface: Colors.white),
    );
