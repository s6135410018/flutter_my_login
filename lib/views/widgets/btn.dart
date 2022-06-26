import 'package:flutter/material.dart';

import '../../constants.dart';

class Btn extends StatelessWidget {
  const Btn({
    Key? key,
    required this.title,
    required this.press,
    required this.color,
    this.textStyle = kTextBtnStyle,
    // this.width = 150.0,
    // this.heigth = 50,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  final Color color;
  final TextStyle textStyle;
  // final double width, heigth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        primary: color,
        fixedSize: Size(200, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
