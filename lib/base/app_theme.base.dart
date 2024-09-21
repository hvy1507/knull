import 'package:flutter/material.dart';

abstract class BaseAppTheme {
  ThemeData get lightThemeData {
    return _getThemeData(Brightness.light);
  }

  ThemeData get darkThemeData {
    return _getThemeData(Brightness.dark);
  }

  ThemeData _getThemeData(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: fontFamily(brightness),
      textTheme: textTheme(brightness),
      colorScheme: colorSchemes(brightness),
      bottomNavigationBarTheme: bottomNavigationBarThemeData(brightness),
      appBarTheme: appBarTheme(brightness),
      filledButtonTheme: filledButtonThemeData(brightness),
      scaffoldBackgroundColor: scaffoldBackgroundColor(brightness),
      cardTheme: cardTheme(brightness),
      dropdownMenuTheme: dropdownMenuThemeData(brightness),
      listTileTheme: listTileTheme(brightness),
      floatingActionButtonTheme: floatingActionButtonTheme(brightness),
      dividerTheme: dividerTheme(brightness),
      switchTheme: switchTheme(brightness),
      bottomSheetTheme: bottomSheetTheme(brightness),
      inputDecorationTheme: inputDecorationTheme(brightness),
      textButtonTheme: textButtonThemeData(brightness),
      dialogTheme: dialogTheme(brightness),
      tabBarTheme: tabBarTheme(brightness),
    );
  }

  String fontFamily(Brightness brightness);

  TextTheme textTheme(Brightness brightness);

  ColorScheme colorSchemes(Brightness brightness);

  Color scaffoldBackgroundColor(Brightness brightness);

  BottomNavigationBarThemeData bottomNavigationBarThemeData(
      Brightness brightness,
      );

  AppBarTheme appBarTheme(Brightness brightness);

  FilledButtonThemeData filledButtonThemeData(Brightness brightness);

  TextButtonThemeData textButtonThemeData(Brightness brightness);

  CardTheme cardTheme(Brightness brightness);

  DropdownMenuThemeData dropdownMenuThemeData(Brightness brightness);

  ListTileThemeData listTileTheme(Brightness brightness);

  FloatingActionButtonThemeData floatingActionButtonTheme(Brightness brightness);

  DividerThemeData dividerTheme(Brightness brightness);

  SwitchThemeData switchTheme(Brightness brightness);

  BottomSheetThemeData bottomSheetTheme(Brightness brightness);

  InputDecorationTheme inputDecorationTheme(Brightness brightness);

  DialogTheme dialogTheme(Brightness brightness);


  TabBarTheme tabBarTheme(Brightness brightness);
}

