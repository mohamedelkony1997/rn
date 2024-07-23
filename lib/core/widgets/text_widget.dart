import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget TextWidget({String? text, Color? color,FontWeight? weight,size,underline}) {
  return Text(
    "$text",
    style: GoogleFonts.inter(
      color: color,
      fontWeight: weight,
      fontSize: size,
       decoration: underline,
    ),
  );
}
