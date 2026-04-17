import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/rich_text.dart';

import '../widgets/auth_body.dart';

class GoogleAuthScreen extends StatelessWidget {
  const GoogleAuthScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return AuthBody1(
      title: '',
      textButton: 'Create account',
      body: Column(
        mainAxisAlignment: .center,
        children: [
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10)
                )
              ),
              child: Text('Google',style: TextStyle(color: Colors.white),)),
          RichTextButton(textOne: '', textTwo: 'Already have an account', textButton: 'Sign in'),
          RichTextButton(textOne: '', textTwo: 'By connecting your account confirm that you agree with our', textButton: 'Term and Condition')
        ],
      ),
    );
  }
}