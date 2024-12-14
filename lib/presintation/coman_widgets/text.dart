import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
        required this.text,
        this.textColor,
        this.fontSize,
        this.fontWeight,
        this.backgroundColor,
        this.fontFamily,
        this.makeItItalic = false,
        this.textDecoration,
        this.textDecorationColor,
        this.decorationThickness,
        this.decorationStyle,
        this.wordSpacing,
        this.textOverflow,
        this.height,
        this.letterSpacing,
        this.maxLines,
        this.textDirection,
        this.textAlign,
        this.shadow});
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final String? fontFamily;
  final bool? makeItItalic;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final double? decorationThickness;
  final TextDecorationStyle? decorationStyle;
  final double? wordSpacing;
  final TextOverflow? textOverflow;
  final double? height;
  final double? letterSpacing;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final List<Shadow>? shadow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        backgroundColor: backgroundColor,
        fontFamily: fontFamily,
        fontStyle: makeItItalic! ? FontStyle.italic : FontStyle.normal,
        decoration: textDecoration,
        decorationColor: textDecorationColor ?? Colors.black,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle,
        wordSpacing: wordSpacing,
        shadows: shadow,
        overflow: textOverflow ?? TextOverflow.ellipsis,
        letterSpacing: letterSpacing,
        height: height,
      ),
      maxLines: maxLines ?? 1,
      textDirection: textDirection,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
