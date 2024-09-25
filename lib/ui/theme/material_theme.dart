import "package:flutter/material.dart";

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,
  filledButtonTheme: filledButtonThemeData,
  textSelectionTheme: textSelectorThemeData.copyWith(
    cursorColor: lightColorScheme.shadow,
  ),
  inputDecorationTheme: inputDecorationTheme.copyWith(
    focusedBorder: defaultBorder.copyWith(
      borderSide: defaultBorder.borderSide.copyWith(
        color: lightColorScheme.shadow,
        width: 3,
      ),
    ),
    enabledBorder: defaultBorder.copyWith(
      borderSide: BorderSide(color: lightColorScheme.shadow, width: 2),
    ),
  ),
  textTheme: textTheme.apply(
    bodyColor: lightColorScheme.shadow,
    displayColor: lightColorScheme.shadow,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  filledButtonTheme: filledButtonThemeData,
  textSelectionTheme:
      textSelectorThemeData.copyWith(cursorColor: darkColorScheme.shadow),
  inputDecorationTheme: inputDecorationTheme.copyWith(
      focusedBorder: defaultBorder.copyWith(
        borderSide: defaultBorder.borderSide.copyWith(
          color: darkColorScheme.shadow,
          width: 3,
        ),
      ),
      enabledBorder: defaultBorder.copyWith(
        borderSide: BorderSide(color: darkColorScheme.shadow, width: 2),
      )),
  textTheme: textTheme.apply(
    bodyColor: darkColorScheme.shadow,
    displayColor: darkColorScheme.shadow,
  ),
);
const def = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Orbitron',
);
TextTheme textTheme = TextTheme(
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

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Colors.red,
  surfaceTint: Color(0xff415f91),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffd6e3ff),
  onPrimaryContainer: Color(0xff001b3e),
  secondary: Color(0xff565f71),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffdae2f9),
  onSecondaryContainer: Color(0xff131c2b),
  tertiary: Color(0xff705575),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xfffad8fd),
  onTertiaryContainer: Color(0xff28132e),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  surface: Colors.white,
  onSurface: Color(0xff191c20),
  onSurfaceVariant: Color(0xff44474e),
  outline: Color(0xff74777f),
  outlineVariant: Color(0xffc4c6d0),
  shadow: Colors.black,
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff2e3036),
  inversePrimary: Color(0xffaac7ff),
  primaryFixed: Color(0xffd6e3ff),
  onPrimaryFixed: Color(0xff001b3e),
  primaryFixedDim: Color(0xffaac7ff),
  onPrimaryFixedVariant: Color(0xff284777),
  secondaryFixed: Color(0xffdae2f9),
  onSecondaryFixed: Color(0xff131c2b),
  secondaryFixedDim: Color(0xffbec6dc),
  onSecondaryFixedVariant: Color(0xff3e4759),
  tertiaryFixed: Color(0xfffad8fd),
  onTertiaryFixed: Color(0xff28132e),
  tertiaryFixedDim: Color(0xffddbce0),
  onTertiaryFixedVariant: Color(0xff573e5c),
  surfaceDim: Color(0xffd9d9e0),
  surfaceBright: Color(0xfff9f9ff),
  surfaceContainerLowest: Color(0xffffffff),
  surfaceContainerLow: Color(0xfff3f3fa),
  surfaceContainer: Color(0xffededf4),
  surfaceContainerHigh: Color(0xffe7e8ee),
  surfaceContainerHighest: Color(0xffe2e2e9),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  // primary: Color(0xff191919),
  primary: Colors.red,
  surfaceTint: Color(0xffaac7ff),
  onPrimary: Color(0xff0a305f),
  primaryContainer: Color(0xff284777),
  onPrimaryContainer: Color(0xffd6e3ff),
  secondary: Color(0xffbec6dc),
  onSecondary: Color(0xff283141),
  secondaryContainer: Color(0xff3e4759),
  onSecondaryContainer: Color(0xffdae2f9),
  tertiary: Color(0xffddbce0),
  onTertiary: Color(0xff3f2844),
  tertiaryContainer: Color(0xff573e5c),
  onTertiaryContainer: Color(0xfffad8fd),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffdad6),
  surface: Color(0xff191919),
  onSurface: Color(0xffe2e2e9),
  onSurfaceVariant: Color(0xffc4c6d0),
  outline: Color(0xff8e9099),
  outlineVariant: Color(0xff44474e),
  shadow: Colors.white,
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffe2e2e9),
  inversePrimary: Color(0xff415f91),
  primaryFixed: Color(0xffd6e3ff),
  onPrimaryFixed: Color(0xff001b3e),
  primaryFixedDim: Color(0xffaac7ff),
  onPrimaryFixedVariant: Color(0xff284777),
  secondaryFixed: Color(0xffdae2f9),
  onSecondaryFixed: Color(0xff131c2b),
  secondaryFixedDim: Color(0xffbec6dc),
  onSecondaryFixedVariant: Color(0xff3e4759),
  tertiaryFixed: Color(0xfffad8fd),
  onTertiaryFixed: Color(0xff28132e),
  tertiaryFixedDim: Color(0xffddbce0),
  onTertiaryFixedVariant: Color(0xff573e5c),
  surfaceDim: Color(0xff111318),
  surfaceBright: Color(0xff37393e),
  surfaceContainerLowest: Color(0xff0c0e13),
  surfaceContainerLow: Color(0xff191c20),
  surfaceContainer: Color(0xff1d2024),
  surfaceContainerHigh: Color(0xff282a2f),
  surfaceContainerHighest: Color(0xff33353a),
);

FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
  style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 16),
      )
      // textStyle: WidgetStateProperty
      ),
);
TextSelectionThemeData textSelectorThemeData =
    const TextSelectionThemeData(cursorColor: Colors.black);
final defaultBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
);
InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  errorStyle: const TextStyle(color: Colors.red),
  errorBorder: defaultBorder.copyWith(
    borderSide: const BorderSide(color: Colors.red,width: 3),
  ),
  focusedErrorBorder: defaultBorder.copyWith(
    borderSide: const BorderSide(color: Colors.red,width: 3),
  ),
  enabledBorder: defaultBorder.copyWith(
    borderSide: const BorderSide(color: Colors.black),
  ),
);
