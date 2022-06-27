import 'package:flutter/material.dart';

import '../../../constants.dart';

class PostAndFollow extends StatelessWidget {
  const PostAndFollow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white.withOpacity(.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberAndTitle(
              number: 236,
              title: "POST",
            ),
            Container(
              width: 4,
              height: 47,
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
            NumberAndTitle(
              number: 154,
              title: "FOLLOWERS",
            ),
            Container(
              width: 4,
              height: 47,
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
            NumberAndTitle(
              number: 30,
              title: "FOLLOWING",
            ),
          ],
        ),
      ),
    );
  }
}

class NumberAndTitle extends StatelessWidget {
  const NumberAndTitle({
    Key? key,
    required this.number,
    required this.title,
  }) : super(key: key);

  final int number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: 25,
            color: kSecondaryColor,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
