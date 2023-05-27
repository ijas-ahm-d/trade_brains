import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

textstyle(double size, FontWeight fweight, Color clr) {
  return GoogleFonts.montserrat(
    letterSpacing: 0.5,
    fontSize: size,
    fontWeight: fweight,
    color: clr,
  );
}