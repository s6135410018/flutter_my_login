import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_login/views/widgets/btn.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';
import '../../models/profile.dart';
import '../../widgets/build_rich_text.dart';
import '../../widgets/build_text_field.dart';
import '../../widgets/login_and_register.dart';
import '../login_ui.dart';
import '../register.dart';

class MainRegister extends StatefulWidget {
  const MainRegister({
    Key? key,
    required LinearGradient gradient,
  })  : _gradient = gradient,
        super(key: key);

  final LinearGradient _gradient;

  @override
  State<MainRegister> createState() => _MainRegisterState();
}

class _MainRegisterState extends State<MainRegister> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();

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
            return Column(
              children: [
                SizedBox(
                  height: 100.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ShaderMask(
                    shaderCallback: (Rect rect) =>
                        widget._gradient.createShader(rect),
                    child: Text(
                      "REGISTER",
                      style: kHeadTitleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
                enterNameAndEmailAndPassword(),
                SizedBox(
                  height: 50.0,
                ),
                Align(
                  child: Btn(
                    title: "Register",
                    press: () {},
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                LoginAndRegisterButton(
                  colorBox: Colors.white.withOpacity(.4),
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
                ),
                SizedBox(
                  height: 10,
                ),
                BuildRichText(
                  textSpan1: "Already an account?",
                  textSpan2: " Log In Now!",
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Column enterNameAndEmailAndPassword() {
    return Column(
      children: [
        BuildTextField(
          text: "Enter Your UserName",
          image: "assets/icons/person.svg",
          validate: RequiredValidator(errorText: "Please Enter Your UserName"),
          save: (value) => profile.name = value.toString().trim(),
        ),
        BuildTextField(
          text: "Enter Your Email",
          image: "assets/icons/email.svg",
          textType: TextInputType.emailAddress,
          validate: MultiValidator(
            [
              RequiredValidator(errorText: "Please Enter Your email"),
              EmailValidator(errorText: "Invalid email format"),
            ],
          ),
          save: (value) => profile.email = value.toString().trim(),
        ),
        BuildTextField(
          text: "Enter Your Password",
          image: "assets/icons/password.svg",
          textType: TextInputType.number,
          obsecure: true,
          validate: RequiredValidator(
            errorText: "Please Enter Your Password",
          ),
          save: (value) => profile.password = value.toString().trim(),
        ),
      ],
    );
  }

  void createEmailAndPassword() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: profile.email,
      password: profile.password,
    );
  }
}