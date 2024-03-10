import 'package:flutter/material.dart';
import 'package:my_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:my_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:my_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:my_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:my_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:my_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:my_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:my_store/utils/theme/custom_themes/text_theme.dart';

class MyAppTheme {
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: MyTextTheme.lightTextTheme,
    chipTheme: MyChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    checkboxTheme: MyCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButton.lightOutlinedButtonTheme,
    inputDecorationTheme: MyTextFieldTheme.lightTextFieldTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: MyTextTheme.darkTextTheme,
    chipTheme: MyChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButton.darkOutlinedButtonTheme,
    inputDecorationTheme: MyTextFieldTheme.darkTextFieldTheme,
  );
}
