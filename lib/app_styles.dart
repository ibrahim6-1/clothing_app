import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color sBrown = Color(0xff292526);
const Color sDarkBrown = Color(0xff1b2028);

const Color sGrey = Color(0xffa4aaad);
const Color sDarkGrey = Color(0xff878787);
const Color sLightGrey = Color(0xffededed);

const Color sBorderColor = Color(0xffEAEAEA);

const Color sWhite = Color(0xffffffff);
const Color sBlack = Color(0xff111111);
const Color sYellow = Color(0xffffd33c);

const double sBorderRadius = 12.0;
const double sPaddinHorizontal = 24.0;

final sInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(sBorderRadius),
  borderSide: const BorderSide(
    color: sLightGrey,
  ),
);

final sEncodeSansBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w700
);

final sEncodeSansSemiBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w600
);

final sEncodeSansMedium = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w500
);

final sEncodeSansRegular = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w400
);
