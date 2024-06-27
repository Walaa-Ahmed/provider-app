
import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';

ThemeData getThemeDataLight() => ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColor.scaffoldBackground,
      primaryColor: AppColor.primaryColor,
      fontFamily: 'DGA',
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColor.primaryColor,
    selectionHandleColor: AppColor.primaryColor,
  ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: const IconThemeData(color: AppColor.primaryColor),
        selectedItemColor: AppColor.primaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColor.primaryColor.withOpacity(.3),
        // selectedLabelStyle: TextStyle(fontSize: 12.sp),
      ),
    );
