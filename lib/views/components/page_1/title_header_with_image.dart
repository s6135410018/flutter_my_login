import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleHeaderWithImage extends StatelessWidget {
  const TitleHeaderWithImage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      width: double.infinity,
      height: 100.0,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 65,
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kLightBlueColor.withOpacity(.4),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 70,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            child: Container(
              height: 8,
              width: 200,
              decoration: BoxDecoration(color: kDarkBlueColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              title,
              style: kHeadTitleStyle,
            ),
          ),
        ],
      ),
    );
  }
}
