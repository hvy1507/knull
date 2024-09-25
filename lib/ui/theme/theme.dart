// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:skeleton/base/app_theme.base.dart';
// import 'package:skeleton/utils/extension/color.ext.dart';
//
// class AppTheme extends BaseAppTheme {
//   factory AppTheme() => _instance;
//
//   AppTheme._();
//
//   static final AppTheme _instance = AppTheme._();
//
//   @override
//   String fontFamily(Brightness brightness) => 'Orbitron';
//
//   @override
//   TextTheme textTheme(Brightness brightness) {
//     const def = TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//     );
//     return TextTheme(
//       displayLarge: def.copyWith(fontSize: 57, fontWeight: FontWeight.w600),
//       displayMedium: def.copyWith(fontSize: 45, fontWeight: FontWeight.w600),
//       displaySmall: def.copyWith(fontSize: 36, fontWeight: FontWeight.w600),
//       headlineLarge: def.copyWith(fontSize: 32),
//       headlineMedium: def.copyWith(fontSize: 28),
//       headlineSmall: def.copyWith(fontSize: 24),
//       titleLarge: def.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
//       titleMedium: def.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
//       titleSmall: def.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
//       bodyLarge: def.copyWith(fontSize: 18),
//       bodyMedium: def,
//       bodySmall: def.copyWith(fontSize: 12),
//       labelLarge: def.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
//       labelMedium: def.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
//       labelSmall: def.copyWith(fontSize: 10, fontWeight: FontWeight.w600),
//     );
//   }
//
//   @override
//   ColorScheme colorSchemes(Brightness brightness) {
//     return ColorScheme(
//       primary: const Color(0xffaac7ff),
//       surfaceTint: const Color(0xffaac7ff),
//       onPrimary: const Color(0xff0a305f),
//       primaryContainer: const Color(0xff284777),
//       onPrimaryContainer: const Color(0xffd6e3ff),
//       secondary: const Color(0xffbec6dc),
//       onSecondary: const Color(0xff283141),
//       secondaryContainer: const Color(0xff3e4759),
//       onSecondaryContainer: const Color(0xffdae2f9),
//       tertiary: const Color(0xffddbce0),
//       onTertiary:  const Color(0xff3f2844),
//       tertiaryContainer: const Color(0xff573e5c),
//       onTertiaryContainer: const Color(0xfffad8fd),
//       error: const Color(0xffffb4ab),
//       onError: const Color(0xff690005),
//       errorContainer: const Color(0xff93000a),
//       onErrorContainer: const Color(0xffffdad6),
//       surface: const Color(0xff111318),
//       onSurface: const Color(0xffe2e2e9),
//       onSurfaceVariant: const Color(0xffc4c6d0),
//       outline: const Color(0xff8e9099),
//       outlineVariant: const Color(0xff44474e),
//       shadow: const Color(0xff000000),
//       scrim: const Color(0xff000000),
//       inverseSurface: const Color(0xffe2e2e9),
//       inversePrimary: const Color(0xff415f91),
//       primaryFixed: const Color(0xffd6e3ff),
//       onPrimaryFixed: const Color(0xff001b3e),
//       primaryFixedDim: const Color(0xffaac7ff),
//       onPrimaryFixedVariant: const Color(0xff284777),
//       secondaryFixed: const Color(0xffdae2f9),
//       onSecondaryFixed: const Color(0xff131c2b),
//       secondaryFixedDim: const Color(0xffbec6dc),
//       onSecondaryFixedVariant: const Color(0xff3e4759),
//       tertiaryFixed: const Color(0xfffad8fd),
//       onTertiaryFixed: const Color(0xff28132e),
//       tertiaryFixedDim: const Color(0xffddbce0),
//       onTertiaryFixedVariant: const Color(0xff573e5c),
//       surfaceDim: const Color(0xff111318),
//       surfaceBright: const Color(0xff37393e),
//       surfaceContainerLowest: const Color(0xff0c0e13),
//       surfaceContainerLow: const Color(0xff191c20),
//       surfaceContainer: const Color(0xff1d2024),
//       surfaceContainerHigh: const Color(0xff282a2f),
//       surfaceContainerHighest: const Color(0xff33353a),
//       brightness: brightness,
//     );
//   }
//
//   @override
//   Color scaffoldBackgroundColor(Brightness brightness) {
//     return colorSchemes(brightness).scaffoldBackground;
//   }
//
//   @override
//   BottomNavigationBarThemeData bottomNavigationBarThemeData(
//     Brightness brightness,
//   ) {
//     return const BottomNavigationBarThemeData(
//       type: BottomNavigationBarType.fixed,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//     );
//   }
//
//   @override
//   AppBarTheme appBarTheme(Brightness brightness) {
//     return AppBarTheme(
//       backgroundColor: colorSchemes(brightness).toolbar,
//       foregroundColor: colorSchemes(brightness).onToolbar,
//       surfaceTintColor: Colors.transparent,
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         systemNavigationBarColor: colorSchemes(brightness).surface,
//       ),
//       centerTitle: true,
//     );
//   }
//
//   @override
//   FilledButtonThemeData filledButtonThemeData(Brightness brightness) {
//     return FilledButtonThemeData(
//       style: ButtonStyle(
//         elevation: const WidgetStatePropertyAll(0),
//         shape: WidgetStatePropertyAll(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         // textStyle: WidgetStateProperty
//       ),
//     );
//   }
//
//   @override
//   TextButtonThemeData textButtonThemeData(Brightness brightness) {
//     return TextButtonThemeData(
//       style: ButtonStyle(
//         elevation: const WidgetStatePropertyAll(0),
//         shape: WidgetStatePropertyAll(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   CardTheme cardTheme(Brightness brightness) {
//     return CardTheme(
//       surfaceTintColor: Colors.transparent,
//       margin: EdgeInsets.zero,
//       elevation: 4,
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     );
//   }
//
//   @override
//   DropdownMenuThemeData dropdownMenuThemeData(Brightness brightness) {
//     return DropdownMenuThemeData(
//         inputDecorationTheme: InputDecorationTheme(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ));
//   }
//
//   @override
//   ListTileThemeData listTileTheme(Brightness brightness) {
//     return ListTileThemeData(
//       tileColor: colorSchemes(brightness).surface,
//       selectedColor: colorSchemes(brightness).onPrimaryContainer,
//       selectedTileColor: colorSchemes(brightness).primaryContainer,
//     );
//   }
//
//   @override
//   FloatingActionButtonThemeData floatingActionButtonTheme(
//       Brightness brightness) {
//     return const FloatingActionButtonThemeData();
//   }
//
//   @override
//   DividerThemeData dividerTheme(Brightness brightness) {
//     return DividerThemeData(
//       color: colorSchemes(brightness).divider,
//       thickness: 1,
//       space: 0,
//     );
//   }
//
//   @override
//   SwitchThemeData switchTheme(Brightness brightness) {
//     return SwitchThemeData(
//       trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
//       trackOutlineWidth: const WidgetStatePropertyAll(0),
//       thumbColor: WidgetStateProperty.resolveWith((states) {
//         if (states.contains(WidgetState.selected)) {
//           return colorSchemes(brightness).onPrimary;
//         } else {
//           return const Color(0x0ff00000);
//         }
//       }),
//       trackColor: WidgetStateProperty.resolveWith((states) {
//         if (states.contains(WidgetState.selected)) {
//           return colorSchemes(brightness).primary;
//         } else {
//           return const Color(0x0ff00000);
//         }
//       }),
//     );
//   }
//
//   @override
//   BottomSheetThemeData bottomSheetTheme(Brightness brightness) {
//     return BottomSheetThemeData(
//       clipBehavior: Clip.antiAlias,
//       showDragHandle: true,
//       dragHandleColor: colorSchemes(brightness).primary,
//       dragHandleSize: const Size(32, 6),
//       backgroundColor: colorSchemes(brightness).surface,
//       surfaceTintColor: Colors.transparent,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12),
//         ),
//       ),
//     );
//   }
//
//   @override
//   TextSelectionThemeData textSelectionThemeData(Brightness brightness) {
//     return const TextSelectionThemeData(
//       cursorColor: Colors.white,
//     );
//   }
//
//   @override
//   InputDecorationTheme inputDecorationTheme(Brightness brightness) {
//     final defaultBorder = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: Colors.white70),
//     );
//     return InputDecorationTheme(
//       errorStyle: const TextStyle(color: Colors.red),
//       hintStyle: TextStyle(
//         color: colorSchemes(brightness).disabled,
//       ),
//       errorBorder: defaultBorder.copyWith(
//         borderSide: const BorderSide(color: Colors.red),
//       ),
//       border: defaultBorder,
//       focusedBorder: defaultBorder.copyWith(
//         borderSide: defaultBorder.borderSide.copyWith(
//           color: Colors.white,
//           width: 3,
//         ),
//       ),
//       enabledBorder: defaultBorder,
//       disabledBorder: defaultBorder.copyWith(
//         borderSide: defaultBorder.borderSide.copyWith(color: Colors.yellow),
//       ),
//       filled: true,
//       fillColor: Colors.grey,
//     );
//   }
//
//   @override
//   DialogTheme dialogTheme(Brightness brightness) {
//     return DialogTheme(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     );
//   }
//
//   @override
//   TabBarTheme tabBarTheme(Brightness brightness) {
//     return const TabBarTheme();
//   }
// }
