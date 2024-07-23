import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ButtonWidget(
    {data,
    onpress,
    Color? color,
    Color? colorborder,
    tr,
    tl,
    br,
    h,
    w,
    bl,
    Widget? svg,
    textcolor,
    iconcolor,
    fontSize}) {
  return ElevatedButton.icon(
    icon: svg,
    onPressed: onpress,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      iconColor: iconcolor,
      fixedSize: Size(w, h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(tr),
            topLeft: Radius.circular(tl),
            bottomLeft: Radius.circular(tl),
            bottomRight: Radius.circular(br),
          ),
          side: BorderSide(color: colorborder!)),
    ),
    label: Text(
      "$data",
      style: GoogleFonts.inter(
        color: textcolor,
        fontSize: fontSize,
      ),
    ),
  );
}
