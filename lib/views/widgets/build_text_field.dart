import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    Key? key,
    required this.text,
    required this.image,
    this.textType = TextInputType.text,
    this.obsecure = false,
    required this.validate,
    required this.save,
  }) : super(key: key);

  final String text, image;
  final TextInputType textType;
  final bool obsecure;
  final String? Function(String?)? validate;
  final Function(String?)? save;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: 15,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          50.0,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(
              0,
              10,
            ),
            blurRadius: 50.0,
            color: kPrimaryColor.withOpacity(.5),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            height: 40,
            color: kPrimaryColor,
          ),
          SizedBox(
            width: kDefaultPadding,
          ),
          Expanded(
            child: TextFormField(
              validator: validate,
              onSaved: save,
              style: TextStyle(color: kSecondaryColor, fontSize: 20),
              keyboardType: textType,
              obscureText: obsecure,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: text,
                hintStyle: kTitleStyle.copyWith(
                  fontSize: 20,
                  color: kPrimaryColor.withOpacity(.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
