import 'package:flutter/material.dart';

import 'page_3/header_profile.dart';
import 'page_3/picture.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({Key? key}) : super(key: key);

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderProfile(
              name: "Samantha",
              image: "assets/images/07.jpg",
            ),
            Picture()
          ],
        ),
      ),
    );
  }
}
