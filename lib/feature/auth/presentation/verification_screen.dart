import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/image_body.dart';
import 'package:marketplace/feature/auth/widgets/rich_text.dart';

import '../widgets/app_text_form_field.dart';
import '../widgets/auth_body.dart';
import '../widgets/opt_widgets.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody1(
      title: 'Verification Code',
      textButton: 'Confirm Code',
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Spacer(),
          ImageBody(),
          Row(
            spacing: 20,
            children: [
              OtpWidget(),
              OtpWidget(),
              OtpWidget(),
              OtpWidget(),
            ],
          ),
          Spacer(),
          RichTextButton(textOne: '',textButton: '00:20', textTwo: 'resend confirmation code.')
        ],
      ),
    );
  }
}