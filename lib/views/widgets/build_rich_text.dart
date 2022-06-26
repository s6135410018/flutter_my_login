import 'package:flutter/material.dart';

import '../../constants.dart';

class BuildRichText extends StatelessWidget {
  const BuildRichText({
    Key? key,
    required this.textSpan1,
    required this.textSpan2,
  }) : super(key: key);
  final String textSpan1, textSpan2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: textSpan1,
            style: kTitleStyle.copyWith(
              color: kSecondaryColor,
            ),
          ),
          TextSpan(
            text: textSpan2,
            style: kTitleStyle.copyWith(
              color: kSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
