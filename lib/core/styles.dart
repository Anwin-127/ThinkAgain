import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16.0,fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0,
      color: Colors.black54,
    ),
  );
}
