import 'package:flutter/material.dart';
import 'package:flutter_my_login/views/components/login_ui.dart';
import 'package:flutter_my_login/views/components/page_1/title_header_with_image.dart';
import 'package:flutter_my_login/views/components/register.dart';

import '../../../constants.dart';
import '../../models/profile.dart';
import '../../widgets/btn.dart';
import '../../widgets/build_rich_text.dart';
import '../../widgets/login_and_register.dart';
import '../../widgets/text_btn.dart';
import 'email_and_password.dart';

class SignInWithEmailAndPassword extends StatefulWidget {
  const SignInWithEmailAndPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInWithEmailAndPassword> createState() =>
      _SignInWithEmailAndPasswordState();
}

class _SignInWithEmailAndPasswordState
    extends State<SignInWithEmailAndPassword> {
  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Colors.white.withOpacity(.5),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            TitleHeaderWithImage(title: "LOGIN"),
            EmailAndPasswordTextField(),
            BuildTextButton(
              textbtn: "Forgot Password?",
              press: () {},
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Btn(
                title: "Login",
                color: kPrimaryColor,
                press: () {},
                textStyle: kTextBtnStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            LoginAndRegisterButton(
              btn1: "Login",
              btn2: "Register",
              press1: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginUI(),
                  ),
                );
              },
              press2: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterUI(),
                  ),
                );
              },
              colorBox: kPrimaryColor.withOpacity(.3),
            ),
            SizedBox(
              height: 10,
            ),
            BuildRichText(
              textSpan1: "Don't you have an account?",
              textSpan2: " Register Now!",
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
