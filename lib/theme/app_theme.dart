import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Main colors matching the design - Enhanced Version
  static const Color primaryBg = Color(0xFF0D3D35); // Lighter vibrant teal
  static const Color secondaryBg = Color(0xFF0A2E27); // Medium teal
  static const Color cardBg = Color(0xFF153D35); // Lighter card background
  static const Color accentGreen = Color(0xFF00FF88); // Bright neon green
  static const Color shimmerGreen = Color(0xFF4DFFB8); // Shimmering mint green
  static const Color glowGreen = Color(0xFF7AFFCC); // Light glow green
  static const Color textPrimary = Color(0xFFFFFFFF); // White
  static const Color textSecondary = Color(0xFFB0B0B0); // Gray

  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryBg,
    primaryColor: cardBg,
    colorScheme: const ColorScheme.dark(
      primary: cardBg,
      secondary: accentGreen,
      surface: primaryBg,
      onPrimary: textPrimary,
      onSecondary: Colors.black,
    ),
    cardColor: cardBg,
    textTheme: GoogleFonts.interTextTheme(
      const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        bodyLarge: TextStyle(fontSize: 16.0, color: textPrimary),
        bodyMedium: TextStyle(fontSize: 14.0, color: textSecondary),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentGreen,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
        elevation: 8,
        shadowColor: accentGreen.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 6,
      shadowColor: shimmerGreen.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: cardBg,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardBg,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: accentGreen, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: secondaryBg,
      selectedItemColor: accentGreen,
      unselectedItemColor: textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );
}
