import 'package:flutter/material.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

part 'app_colors.dart';
part 'theme_sizes.dart';

/// Light theme
final ThemeData lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    /* primary */
    primary: kPrimary,
    // onPrimary: kOnPrimary,
    /* secondary */
    secondary: kSecondary,
    onSecondary: kOnSecondary,

    /* tertiary */
    // tertiary: kTertiary,

    /* background colors */
    surface: kSurface,
    onSurface: kOnSurface,

    /* outline (border) */
    // outline: kOutline,
    // outlineVariant: kOutlineVariant,

    /* statuses */
    error: kError,
    inversePrimary: kSuccess,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 57.sp,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: const Color.fromRGBO(3, 3, 25, 1),
      ),
    ),
    displayMedium: TextStyle(
      fontSize: 45.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(17, 15, 11, 1),
      fontFamily: 'ProximaNova',
    ),
    displaySmall: GoogleFonts.poppins(
      textStyle: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w400, color: Colors.black),
    ),
    headlineMedium: GoogleFonts.poppins(
      textStyle: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700, color: Colors.black),
    ),
    bodyLarge: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: const Color.fromRGBO(11, 11, 11, 1),
      ),
    ),
    bodyMedium: GoogleFonts.poppins(
      textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, color: Colors.black),
    ),
    bodySmall: GoogleFonts.poppins(
      textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: kInputText),
    ),
    labelLarge: GoogleFonts.poppins(
      textStyle: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),
    ),
    labelMedium: TextStyle(
      color: const Color.fromRGBO(90, 107, 104, 1),
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 11.sp,
        fontWeight: FontWeight.w700,
        height: 1.5,
      ),
    ),
    titleLarge: GoogleFonts.poppins(
      textStyle: TextStyle(color: kInputText, fontSize: 22.sp, fontWeight: FontWeight.w500),
    ),
    titleMedium: GoogleFonts.poppins(
      textStyle: TextStyle(color: kInputText, fontSize: 16.sp, fontWeight: FontWeight.w500),
    ),
    titleSmall: GoogleFonts.poppins(
      textStyle: TextStyle(color: kSecondary, fontSize: 14.sp, fontWeight: FontWeight.w400),
    ),
  ),
  dividerColor: Colors.black,
  appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
  // dialogTheme: DialogThemeData(
  //   titleTextStyle: GoogleFonts.poppins(
  //     textStyle: TextStyle(
  //       color: kInputText,
  //       fontSize: 36.sp,
  //       fontWeight: FontWeight.w500,
  //     ),
  //   ),
  // ),
  inputDecorationTheme: _inputDecorationTheme,
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      // textStyle: GoogleFonts.poppins(
      //   textStyle: TextStyle(
      //     color: kOnPrimary,
      //     fontWeight: FontWeight.w500,
      //     fontSize: 34.sp,
      //   ),
      // ),
      shape: _buttonRadius,
      elevation: 5,
      shadowColor: const Color.fromRGBO(28, 116, 72, .6),
    ),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: const TextStyle(color: Color.fromRGBO(58, 58, 58, 1)),
    selectedColor: const Color.fromRGBO(58, 58, 58, 1),
    selectedTileColor: const Color.fromRGBO(209, 232, 237, 0.6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.sp))),
  ),
  scaffoldBackgroundColor: Colors.white,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: kOutlineBtnLabel,
      side: BorderSide(width: 1.w),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      // textStyle: GoogleFonts.poppins(
      //   textStyle: TextStyle(
      //     color: kOutlineBtnLabel,
      //     fontWeight: FontWeight.w400,
      //     fontSize: 24.sp,
      //   ),
      // ),
      shape: _buttonRadius,
    ),
  ),
);

// TODO(theme): Dark theme
/// Dark theme
final darkTheme = ThemeData.dark();

final _buttonRadius = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r));

/// Input decoration theme for,
/// TextField, TextFormField
final _inputDecorationTheme = InputDecorationTheme(
  fillColor: kInputBg,
  filled: true,
  labelStyle: GoogleFonts.poppins(
    color: kInputLabel,
    // fontSize: 25.sp,
    fontWeight: FontWeight.w400,
  ),
  prefixStyle: GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: kInputText,
      // fontSize: 26.sp,
      fontWeight: FontWeight.w500,
    ),
  ),
  hintStyle: TextStyle(
    color: kInputText.withValues(alpha: .5),
    // fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    // fontFamily: 'Poppins',
  ),
  errorMaxLines: 3,
  alignLabelWithHint: true,
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10.r),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10.r),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10.r),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10.r),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10.r),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10.r),
  ),
);
