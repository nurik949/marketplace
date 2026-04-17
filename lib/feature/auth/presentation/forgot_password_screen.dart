import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/image_body.dart';
import 'package:marketplace/feature/auth/widgets/rich_text.dart';

import '../widgets/app_text_form_field.dart';
import '../widgets/auth_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody1(
      title: 'Forgot Password',
      textButton: 'Confirm Mail',
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Spacer(),
          ImageBody(),
          AppTextFormField(title: 'Email Address' ),
          Spacer(),
          RichTextButton(textOne: '', textTwo: 'Please write your email to receive a\n       confirmation code to set a new password.', textButton: '')
        ],
      ),
    );
  }
}