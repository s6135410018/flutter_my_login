import 'package:flutter/material.dart';
import 'package:flutter_my_login/views/components/login_ui.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginUI(),
    );
  }
}