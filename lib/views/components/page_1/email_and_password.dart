import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../models/profile.dart';
import '../../widgets/build_text_field.dart';

class EmailAndPasswordTextField extends StatefulWidget {
  const EmailAndPasswordTextField({
    Key? key,
    required this.formkey,
    required this.profile,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;
  final Profile profile;

  @override
  State<EmailAndPasswordTextField> createState() =>
      _EmailAndPasswordTextFieldState();
}

class _EmailAndPasswordTextFieldState extends State<EmailAndPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Column(
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
            save: (value) => widget.profile.email = value.toString().trim(),
          ),
          BuildTextField(
            text: "Password",
            image: "assets/icons/password.svg",
            obsecure: true,
            textType: TextInputType.number,
            validate: RequiredValidator(
              errorText: "Please Enter Your Password",
            ),
            save: (value) => widget.profile.password = value.toString().trim(),
          ),
        ],
      ),
    );
  }
}
