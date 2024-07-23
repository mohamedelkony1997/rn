import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rn/core/theming/colors.dart';


Widget TextFormFieldAuth(
    {controller, type, Icon? icon, texthint, hintvalidator}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: ColorsApp.border,width: 2),

      ),
       enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: ColorsApp.border,
                    width: 2.0,
                  ),
                ),
      prefixIcon: Padding(
        padding: EdgeInsets.all(5.0),
        child: icon,
      ),
      hintText: texthint,
      hintStyle:
          GoogleFonts.inter(color: ColorsApp.labelTextformfeild, fontSize: 16),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
      filled: true,
      fillColor: ColorsApp.mainwhite,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return '$hintvalidator';
      }
      return null;
    },
  );
}
