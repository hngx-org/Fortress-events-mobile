import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading, title, trailing;
  static const SizedBox emptySizedBox = const SizedBox.shrink();

  CustomListTile(
      {this.title = emptySizedBox,
      this.leading = emptySizedBox,
      this.trailing = emptySizedBox,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          leading!,
          if (leading != emptySizedBox)
            const SizedBox(
              width: 8,
            ),
          Expanded(
            child: SizedBox(
              child: title,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          trailing!,
        ],
      ),
    );
  }
}
