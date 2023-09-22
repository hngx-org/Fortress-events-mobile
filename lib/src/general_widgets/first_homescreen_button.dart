import 'package:flutter/material.dart';

import '../core/constants/dimensions.dart';

class FirstHomeScreenButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final String buttonText;
  final Color textColor;

  FirstHomeScreenButton(
      {this.backgroundColor = const Color(0xFF063B27),
      this.borderColor = const Color(0xFF063B27),
      this.buttonText = 'Get Started',
      this.textColor = const Color(0xFF063B27)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(Dimensions.small),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
          border: Border.all(color: borderColor), // Add a border
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
