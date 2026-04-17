import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/image_body.dart';
import 'package:marketplace/feature/auth/widgets/rich_text.dart';

import '../widgets/app_text_form_field.dart';
import '../widgets/auth_body.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody1(
      title: 'New Password',
      textButton: 'Confirm Password',
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Spacer(),
          AppTextFormField(title: 'Password' ),
          AppTextFormField(title: 'Confirm Password'),
          Spacer(),
          RichTextButton(textOne: '', textTwo: 'Please write your new password.', textButton: '')
        ],
      ),
    );
  }
}