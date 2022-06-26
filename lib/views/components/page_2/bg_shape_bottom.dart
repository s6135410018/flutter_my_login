import 'package:flutter/material.dart';

import '../../../constants.dart';

class BackgroundShapeBottom extends StatelessWidget {
  const BackgroundShapeBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper2(),
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(.7),
          ),
        ),
      ),
    );
  }
}

class Clipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(0 - 110, 0);
    path.quadraticBezierTo(0 - 100, 0, 0, size.height - 50);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
