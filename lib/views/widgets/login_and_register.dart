import 'package:flutter/material.dart';
import 'package:flutter_my_login/views/widgets/btn.dart';

import '../../constants.dart';

class LoginAndRegisterButton extends StatelessWidget {
  const LoginAndRegisterButton({
    Key? key,
    required this.btn1,
    required this.btn2,
    required this.press1, 
    required this.press2, 
    this.colorBox = kPrimaryColor,
  }) : super(key: key);

  final String btn1, btn2;
  final VoidCallback press1, press2;
  final Color colorBox;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: 5,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 3.0,
        vertical: 5.0,
      ),
      height: 70.0,
      decoration: BoxDecoration(
        color: colorBox,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: press1,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  btn1,
                  style: kTextBtnStyle.copyWith(
                    color: kSecondaryColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Btn(
              title: btn2,
              color: kPrimaryColor,
              textStyle: kTextBtnStyle,
              press:  press2,
              // heigth: 60.0,
              // width: 170.0,
            ),
          ),
        ],
      ),
    );
  }
}
