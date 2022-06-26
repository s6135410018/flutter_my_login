import 'package:flutter/material.dart';

import '../../constants.dart';

class BuildTextButton extends StatelessWidget {
  const BuildTextButton({
    Key? key,
    required this.textbtn, required this.press,
  }) : super(key: key);
  final String textbtn;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kDefaultPadding, top: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: press,
            child: Text(
              textbtn,
              style: kTitleStyle.copyWith(
                color: kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
