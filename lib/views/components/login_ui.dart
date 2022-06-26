import 'package:flutter/material.dart';
import 'package:flutter_my_login/constants.dart';

import 'page_1/header.dart';
import 'page_1/sign_in.dart';


class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width:  MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kPrimaryColor.withOpacity(.13),
              Color(0xFF1DFFD6).withOpacity(.4),
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                SignInWithEmailAndPassword(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}



