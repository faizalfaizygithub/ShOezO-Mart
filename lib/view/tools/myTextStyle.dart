import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get headingStyle {
  return GoogleFonts.aBeeZee(
      textStyle: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87));
}

TextStyle get subheadingStyle {
  return GoogleFonts.aBeeZee(
      textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 17, 84, 117)));
}

TextStyle get smallTextStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black54));
}

TextStyle get mediumTextStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87));
}
