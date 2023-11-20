import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaf_uikit/constants/_index.dart';

enum FontFamily { lato, plusJakartaSans }

class VAFText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontFamily? fontFamily;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final TextDecoration? decoration;
  final bool? softWrap;

  const VAFText(
    this.text, {
    super.key,
    this.color = VAFColors.CHARCOAL,
    this.fontWeight,
    this.fontSize = 12,
    this.textAlign,
    this.fontFamily = FontFamily.lato,
    this.fontStyle,
    this.maxLines,
    this.overflow,
    this.height,
    this.decoration,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    if (fontFamily == FontFamily.plusJakartaSans) {
      return Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        style: GoogleFonts.plusJakartaSans(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle,
          height: height,
          decoration: decoration,
        ),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: GoogleFonts.lato(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontStyle: fontStyle,
        height: height,
        decoration: decoration,
      ),
    );
  }
}
