import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../models/profile.dart';
import '../../widgets/build_text_field.dart';

class EmailAndPasswordTextField extends StatefulWidget {
  const EmailAndPasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<EmailAndPasswordTextField> createState() =>
      _EmailAndPasswordTextFieldState();
}

class _EmailAndPasswordTextFieldState extends State<EmailAndPasswordTextField> {
  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildTextField(
          text: "Email",
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
          text: "Password",
          image: "assets/icons/password.svg",
          obsecure: true,
          textType: TextInputType.number,
          validate: RequiredValidator(
            errorText: "Please Enter Your Password",
          ),
          save: (value) => profile.password = value.toString().trim(),
        ),
      ],
    );
  }
}
