import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';

class Picture extends StatelessWidget {
  const Picture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        right: kDefaultPadding / 4,
        left: kDefaultPadding / 4,
      ),
      child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: kSecondaryColor.withOpacity(.3),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PicItem(
                  image: ["assets/images/01.jpg", "assets/images/02.jpg"],
                ),
                PicItem(
                  image: ["assets/images/03.jpg", "assets/images/04.jpg"],
                ),
                PicItem(
                  image: ["assets/images/05.jpg", "assets/images/06.jpg"],
                ),
              ],
            ),
          )),
    );
  }
}

class PicItem extends StatelessWidget {
  const PicItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  final List<String> image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
        horizontal: kDefaultPadding / 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 180,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                50.0,
              ),
              image: DecorationImage(
                image: AssetImage(
                  image[0],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: LikeAndComment(),
          ),
          Container(
            width: 180,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                50.0,
              ),
              image: DecorationImage(
                image: AssetImage(
                  image[1],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: LikeAndComment(),
          ),
        ],
      ),
    );
  }
}

class LikeAndComment extends StatelessWidget {
  const LikeAndComment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.7),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "142",
                    style: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "63",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
