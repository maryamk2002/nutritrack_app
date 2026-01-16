import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF27A44D);
  static const Color primaryDark = Color(0xFF32A550);
  static const Color primaryLight = Color(0xFFDBF6E4);
  
  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF9F9F9);
  static const Color backgroundTertiary = Color(0xFFF0FDF4);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF202937);
  static const Color textSecondary = Color(0xFF384151);
  static const Color textMuted = Color(0xFFADADAD);
  static const Color textLight = Color(0xFF6B6B6B);
  
  // Input Colors
  static const Color inputBackground = Color(0xFFFBFBFB);
  static const Color inputBorder = Color(0xFFE4E4E4);
  static const Color placeholder = Color(0xFFCDCDCD);
  
  // Border Colors
  static const Color border = Color(0xFFE4E4E4);
  static const Color borderDark = Color(0xFF394150);
  
  // Accent Colors
  static const Color accentOrange = Color(0xFFF97316);
  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color accentPurple = Color(0xFF8B5CF6);
  static const Color accentRed = Color(0xFFEF4444);
  
  // Nutrition Colors
  static const Color protein = Color(0xFF3B82F6);
  static const Color carbs = Color(0xFFF97316);
  static const Color fat = Color(0xFF8B5CF6);
  static const Color fiber = Color(0xFF22C55E);
  
  // Progress Colors
  static const Color progressGreen = Color(0xFF22C55E);
  static const Color progressYellow = Color(0xFFFBBF24);
  static const Color progressRed = Color(0xFFEF4444);
  
  // Shadow
  static const Color shadow = Color(0x26000000);
  
  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF27A44D), Color(0xFF22C55E)],
  );
}

