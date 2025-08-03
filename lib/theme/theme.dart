import 'package:flutter/material.dart';
import 'package:flutter_auth/extensions/extensions.dart';

part 'app_colors.dart';
part 'theme_sizes.dart';

/// Input decoration theme for,
/// TextField, TextFormField, DropDownMenu
final _inputDecorationTheme = InputDecorationTheme(
  fillColor: Colors.white,
  filled: true,
  isDense: true,
  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
  labelStyle: const TextStyle(color: kOnSurface),
  hintStyle: const TextStyle(color: kDisabled),
  // hintStyle: const TextStyle(color: kTextHint),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: kOutline),
    borderRadius: BorderRadius.circular(4),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: kOutline),
    borderRadius: BorderRadius.circular(4),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: kDisabled),
    borderRadius: BorderRadius.circular(4),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: kOutlineFocused),
    borderRadius: BorderRadius.circular(4),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: kError),
    borderRadius: BorderRadius.circular(4),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: kError),
    borderRadius: BorderRadius.circular(4),
  ),
);

const Color _kShadowColor = kGray200;

/// Typography
// final _titleLarge = TextStyle(
//   fontSize: 18.sp,
//   // height: 20,
//   fontWeight: FontWeight.w900,
//   color: kGray900,
// );
// final _titleMedium = TextStyle(
//   fontSize: 14.sp,
//   // height: 20,
//   fontWeight: FontWeight.w500,
//   color: kGray900,
// );
// final _titleSmall = TextStyle(
//   fontSize: 12.sp,
//   // height: 20,
//   fontWeight: FontWeight.w500,
//   color: kGray300,
// );

/// Light theme
final ThemeData lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: kPrimary,
    // onPrimary: kOnPrimary,
    primaryContainer: kPrimaryContainer,
    onPrimaryContainer: kOnPrimaryContainer,

    // /* secondary */
    // secondary: kSecondary,
    // onSecondary: kOnSecondary,
    // secondaryContainer: kSecondaryContainer,

    // /* tertiary */
    // tertiary: kTertiary,
    // onTertiary: kOnTertiary,
    // tertiaryContainer: kTertiaryContainer,
    // onTertiaryContainer: kOnTertiaryContainer,

    /* background colors */
    shadow: _kShadowColor,
    // background: kBackground,
    // // on hover
    // surface: kSurface,
    surfaceContainer: kGray50,
    onSurface: kOnSurface,
    surfaceContainerHighest: kSurfaceContainer,

    /* outline (border) */
    outline: kOutline,
    outlineVariant: kOutlineVariant,

    /* statuses */
    error: kError,
  ),
  /* Text */
  // textTheme: TextTheme(titleMedium: _titleMedium),
  /* Widget colors */
  cardTheme: CardThemeData(
    shadowColor: _kShadowColor,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: kGray300),
      borderRadius: BorderRadius.circular(12.r),
    ),
  ),
  dataTableTheme: DataTableThemeData(
    headingRowColor: WidgetStateColor.resolveWith((states) => kGray50),
  ),
  dialogTheme: const DialogThemeData(
    titleTextStyle: TextStyle(color: kGray900),
    backgroundColor: kSurface,
  ),
  dividerTheme: const DividerThemeData(color: kOutline),
  drawerTheme: const DrawerThemeData(
    backgroundColor: kSurfaceContainer,
    shape: RoundedRectangleBorder(),
  ),
  listTileTheme: ListTileThemeData(
    selectedTileColor: kPrimaryContainer,
    dense: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
  ),
  inputDecorationTheme: _inputDecorationTheme,
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 24.w),
      // textStyle: _titleMedium.copyWith(color: kOnPrimary, fontWeight: FontWeight.w700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    ),
  ),
  scaffoldBackgroundColor: kSurface,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 24.w),
      // textStyle: _titleMedium.copyWith(color: kOnPrimaryContainer, fontWeight: FontWeight.w700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: TextStyle(color: kOnSurface, fontSize: 15.sp, fontWeight: FontWeight.w700),
    // inputDecorationTheme: _inputDecorationTheme,
  ),
  menuButtonTheme: const MenuButtonThemeData(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.white)),
  ),
);

/// Dark theme
// TODO(darkTheme): add dark theme.
final darkTheme = ThemeData.dark();
