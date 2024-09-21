import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeleton/base/app_theme.base.dart';
import 'package:skeleton/utils/extension/color.ext.dart';

class AppTheme extends BaseAppTheme {
  factory AppTheme() => _instance;

  AppTheme._();

  static final AppTheme _instance = AppTheme._();

  @override
  String fontFamily(Brightness brightness) => 'Font Family';

  @override
  TextTheme textTheme(Brightness brightness) {
    const def = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    return TextTheme(
      displayLarge: def.copyWith(fontSize: 57, fontWeight: FontWeight.w600),
      displayMedium: def.copyWith(fontSize: 45, fontWeight: FontWeight.w600),
      displaySmall: def.copyWith(fontSize: 36, fontWeight: FontWeight.w600),
      headlineLarge: def.copyWith(fontSize: 32),
      headlineMedium: def.copyWith(fontSize: 28),
      headlineSmall: def.copyWith(fontSize: 24),
      titleLarge: def.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
      titleMedium: def.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
      titleSmall: def.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
      bodyLarge: def.copyWith(fontSize: 18),
      bodyMedium: def,
      bodySmall: def.copyWith(fontSize: 12),
      labelLarge: def.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      labelMedium: def.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
      labelSmall: def.copyWith(fontSize: 10, fontWeight: FontWeight.w600),
    );
  }

  @override
  ColorScheme colorSchemes(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: const Color(0x0ff00000),
      onPrimary: const Color(0x0ff00000),
      primaryContainer: const Color(0x0ff00000),
      onPrimaryContainer: const Color(0x0ff00000),
      secondary: const Color(0x0ff00000),
      onSecondary: const Color(0x0ff00000),
      error: const Color(0x0ff00000),
      onError: const Color(0x0ff00000),
      surface: const Color(0x0ff00000),
      onSurface: const Color(0x0ff00000),
    );
  }

  @override
  Color scaffoldBackgroundColor(Brightness brightness) {
    return colorSchemes(brightness).scaffoldBackground;
  }

  @override
  BottomNavigationBarThemeData bottomNavigationBarThemeData(
    Brightness brightness,
  ) {
    return const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  AppBarTheme appBarTheme(Brightness brightness) {
    return AppBarTheme(
      backgroundColor: colorSchemes(brightness).toolbar,
      foregroundColor: colorSchemes(brightness).onToolbar,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: colorSchemes(brightness).surface,
      ),
      centerTitle: true,
    );
  }

  @override
  FilledButtonThemeData filledButtonThemeData(Brightness brightness) {
    return FilledButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // textStyle: WidgetStateProperty
      ),
    );
  }

  @override
  TextButtonThemeData textButtonThemeData(Brightness brightness) {
    return TextButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  CardTheme cardTheme(Brightness brightness) {
    return CardTheme(
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  DropdownMenuThemeData dropdownMenuThemeData(Brightness brightness) {
    return DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ));
  }

  @override
  ListTileThemeData listTileTheme(Brightness brightness) {
    return ListTileThemeData(
      tileColor: colorSchemes(brightness).surface,
      selectedColor: colorSchemes(brightness).onPrimaryContainer,
      selectedTileColor: colorSchemes(brightness).primaryContainer,
    );
  }

  @override
  FloatingActionButtonThemeData floatingActionButtonTheme(
      Brightness brightness) {
    return const FloatingActionButtonThemeData();
  }

  @override
  DividerThemeData dividerTheme(Brightness brightness) {
    return DividerThemeData(
      color: colorSchemes(brightness).divider,
      thickness: 1,
      space: 0,
    );
  }

  @override
  SwitchThemeData switchTheme(Brightness brightness) {
    return SwitchThemeData(
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      trackOutlineWidth: const WidgetStatePropertyAll(0),
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorSchemes(brightness).onPrimary;
        } else {
          return const Color(0x0ff00000);
        }
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorSchemes(brightness).primary;
        } else {
          return const Color(0x0ff00000);
        }
      }),
    );
  }

  @override
  BottomSheetThemeData bottomSheetTheme(Brightness brightness) {
    return BottomSheetThemeData(
      clipBehavior: Clip.antiAlias,
      showDragHandle: true,
      dragHandleColor: colorSchemes(brightness).primary,
      dragHandleSize: const Size(32, 6),
      backgroundColor: colorSchemes(brightness).surface,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    );
  }

  @override
  InputDecorationTheme inputDecorationTheme(Brightness brightness) {
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: colorSchemes(brightness).disabled,
      ),
    );
    return InputDecorationTheme(
      hintStyle: TextStyle(
        color: colorSchemes(brightness).disabled,
      ),
      border: defaultBorder,
      enabledBorder: defaultBorder,
      disabledBorder: defaultBorder.copyWith(
        borderSide: defaultBorder.borderSide.copyWith(
          color: defaultBorder.borderSide.color.withOpacity(.5),
        ),
      ),
      filled: true,
      fillColor: colorSchemes(brightness).surface,
    );
  }

  @override
  DialogTheme dialogTheme(Brightness brightness) {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  TabBarTheme tabBarTheme(Brightness brightness) {
    return const TabBarTheme();
  }
}
