import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';

class CustomAppName extends StatelessWidget {
  final Color? greenTitleColor;
  final double textSize;
  const CustomAppName({
    super.key,
    this.greenTitleColor,
    this.textSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: "Green",
            style: TextStyle(
              color: greenTitleColor ?? CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "grocer",
            style: TextStyle(
              color: CustomColors.customContrastColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
