import 'package:flutter/material.dart';
import 'package:flutter_my_login/constants.dart';

import 'page_2/bg_shape_bottom.dart';
import 'page_2/bg_shape_top.dart';
import 'page_2/main_register.dart';

class RegisterUI extends StatefulWidget {
  const RegisterUI({Key? key}) : super(key: key);

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  final LinearGradient _gradient = LinearGradient(
    colors: [
      kPrimaryColor,
      Color(
        0xFF00A5C9,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundShapeTop(),
                BackgroundShapeBottom(),
                MainRegister(gradient: _gradient),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

