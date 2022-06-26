import 'package:flutter/material.dart';

import '../../../constants.dart';

class BackgroundShapeTop extends StatelessWidget {
  const BackgroundShapeTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper(),
      child: Container(
        alignment: Alignment.bottomLeft,
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: kDarkBlueColor.withOpacity(.3),
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 2 - 30, 0);
    path.quadraticBezierTo(
      size.width / 2 + 20,
      size.height - 20,
      size.width + 50,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
