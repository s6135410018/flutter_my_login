import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_login/views/components/page_1/title_header_with_image.dart';
import 'package:flutter_my_login/views/components/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
import '../../models/profile.dart';
import '../../widgets/btn.dart';
import '../../widgets/build_rich_text.dart';
import '../../widgets/login_and_register.dart';
import '../../widgets/text_btn.dart';
import '../profile_ui.dart';
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
  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  String msg = '';

  @override
  void initState() {
    super.initState();
  }

  Future checkStatus() async {
    FirebaseAuth.instance.currentUser?.updateDisplayName(profile.name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              "${snapshot.error}",
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return buildPageRegister(context);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  SingleChildScrollView buildPageRegister(BuildContext context) {
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
            EmailAndPasswordTextField(
              formkey: formKey,
              profile: profile,
            ),
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
                press: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    checkStatus();

                    signInWithEmailAndPassword();
                  }
                },
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
              press1: () {},
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

  Future signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: profile.email,
        password: profile.password,
      )
          .then((value) {
        formKey.currentState!.reset();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileUI(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        msg = "Password must be at least 6 characters long.";
      } else {
        msg = e.message.toString();
      }
      Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.TOP,
        backgroundColor: kPrimaryColor,
        textColor: kSecondaryColor,
        fontSize: 20.0,
        timeInSecForIosWeb: 1,
      );
    }
  }
}
