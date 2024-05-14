// ignore_for_file: avoid_print

import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/data/mock_database.dart';
import 'package:bayfin/src/features/authentication/presentation/login_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    DatabaseRepository databaseRepository = MockDatabase();

    return MaterialApp(
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff212c95),
          primaryContainer: Color(0xffE6E9FF),
          secondary: Color(0xffE6E9FF),
          secondaryContainer: Color(0xffe6e9ff),
          tertiary: Color(0xff006875),
          tertiaryContainer: Color(0xff95f0ff),
          appBarColor: Color(0xffe6e9ff),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        blendLevel: 12,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 8,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          defaultRadius: 14.0,
          elevatedButtonRadius: 40.0,
          elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,
          toggleButtonsBorderSchemeColor: SchemeColor.primary,
          segmentedButtonSchemeColor: SchemeColor.primary,
          segmentedButtonBorderSchemeColor: SchemeColor.primary,
          unselectedToggleIsColored: true,
          sliderValueTinted: true,
          inputDecoratorSchemeColor: SchemeColor.primary,
          inputDecoratorBackgroundAlpha: 31,
          inputDecoratorUnfocusedHasBorder: false,
          inputDecoratorFocusedBorderWidth: 1.0,
          inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
          fabUseShape: true,
          fabAlwaysCircular: true,
          fabSchemeColor: SchemeColor.tertiary,
          popupMenuRadius: 8.0,
          popupMenuElevation: 3.0,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          drawerIndicatorRadius: 12.0,
          drawerIndicatorSchemeColor: SchemeColor.primary,
          bottomNavigationBarMutedUnselectedLabel: false,
          bottomNavigationBarMutedUnselectedIcon: false,
          menuRadius: 8.0,
          menuElevation: 3.0,
          menuBarRadius: 0.0,
          menuBarElevation: 2.0,
          menuBarShadowColor: Color(0x00000000),
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.primary,
          navigationBarIndicatorOpacity: 1.00,
          navigationBarIndicatorRadius: 12.0,
          navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.primary,
          navigationRailIndicatorOpacity: 1.00,
          navigationRailIndicatorRadius: 12.0,
          navigationRailBackgroundSchemeColor: SchemeColor.surface,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          keepPrimary: true,
        ),
        tones: FlexTones.jolly(Brightness.light),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ).copyWith(
        textTheme: GoogleFonts.racingSansOneTextTheme(),
      ),
      home: LoginScreen(databaseRepository: databaseRepository),
    );
  }
}
