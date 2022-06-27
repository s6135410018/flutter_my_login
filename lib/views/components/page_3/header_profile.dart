import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_login/views/components/login_ui.dart';
import 'package:flutter_my_login/views/home_ui.dart';

import '../../../constants.dart';
import 'post_and_follow.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(.7),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(
              30.0,
            ),
          )),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: kDefaultPadding,
                  top: kDefaultPadding * 2,
                  bottom: kDefaultPadding / 2,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        return Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeUI(),
                          ),
                        );
                      });
                    },
                    icon: Icon(
                      Icons.exit_to_app_rounded,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              Container(
                width: 160.0,
                height: 155.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 35.0,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      // name.toString(),
                    ),
                  ],
                ),
              ),
              PostAndFollow(),
            ],
          )
        ],
      ),
    );
  }
}
