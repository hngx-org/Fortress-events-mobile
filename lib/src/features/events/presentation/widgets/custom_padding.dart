import 'package:flutter/material.dart';

class customPadding extends StatelessWidget {
  const customPadding(Text text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
    );
  }
}
