import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(double size, Color color, FontWeight fw, {double height = 1.4}) {
  return GoogleFonts.bebasNeue(fontSize: size, color: color, fontWeight: fw, height: height);
}

TextStyle appstyleNormal(double size, Color color, FontWeight fw, {double height = 1.4}) {
  return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: fw, height: height);
}
