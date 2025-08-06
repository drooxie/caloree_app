import 'package:caloree_app/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.brand500,
    scaffoldBackgroundColor: Colors.black,
    textTheme: GoogleFonts.outfitTextTheme().apply(
      displayColor: AppColors.white,
      bodyColor: AppColors.white.withValues(alpha: 0.7),
    ),
  );
}
