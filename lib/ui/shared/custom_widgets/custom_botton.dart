// import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:api_challenge/ui/shared/colors.dart';
import 'package:api_challenge/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({
    Key? key,
    required this.customText,
    this.backgroundColor = AppColors.white,
    this.gradient,
    required this.showGradient,
    this.linearGradient,
  }) : super(key: key);

  final CustomText customText;
  final Gradient? gradient;
  final bool showGradient;
  final Color? backgroundColor;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.4,
      height: size.width / 8,
      child: Center(
        child: customText,
      ),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(25),
        borderRadius: BorderRadius.circular(10),
        gradient: showGradient
            ? linearGradient ??
                LinearGradient(
                  colors: [
                    AppColors.blue100,
                    AppColors.blue100,
                    AppColors.blue200,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
            : null,
        color: backgroundColor,
      ),
    );
  }
}
