import 'package:api_challenge/ui/shared/colors.dart';
import 'package:flutter/material.dart';

enum TextStyleType {
  TITLE,
  SUBTITLE,
  BODY,
  SMALL,
  CUSTOM,
}

class CustomText extends StatelessWidget {
  final String? text;
  final TextStyleType? styleType;
  final Color? textColor;

  final FontWeight? fontWeight;
  final double? fontSize;

  const CustomText({
    super.key,
    required this.text,
    this.styleType = TextStyleType.BODY,
    this.textColor = AppColors.greyColor,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      text!,
      style: getStyle(size),
    );
  }

  TextStyle getStyle(Size size) {
    TextStyle result = TextStyle();

    switch (styleType) {
      case TextStyleType.TITLE:
        result = TextStyle(
            fontSize: size.width / 15,
            fontWeight: fontWeight ?? FontWeight.bold,
            color: textColor);
        break;
      case TextStyleType.SUBTITLE:
        result = TextStyle(
            fontSize: size.width / 24,
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.BODY:
        result = TextStyle(
            fontSize: size.width / 28,
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.SMALL:
        result = TextStyle(
            fontSize: size.width / 30,
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.CUSTOM:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
        break;

      default:
        result = TextStyle(
            fontSize: size.width / 28,
            fontWeight: FontWeight.normal,
            color: textColor);
        break;
    }

    return result;
  }
}
