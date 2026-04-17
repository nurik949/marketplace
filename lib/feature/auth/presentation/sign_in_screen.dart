import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/rich_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../Test.dart';
import '../widgets/app_text_form_field.dart';
import '../widgets/auth_body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final SupabaseClient client = Supabase.instance.client;
  final _key = GlobalKey<FormState>();

  bool isSwitched = false;

  void signIn() async {
    try {
      if (_key.currentState!.validate()) {
        final response = await client.auth.signInWithPassword(
          password: passwordController.text,
          email: emailController.text,
        );

        if (response.user != null && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(backgroundColor: Colors.green,
              content: Text('Вы успешно вошли')));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text('неправельный пароль или логин')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return AuthBody1(
      title: 'Welcome',
      textButton: 'Login',
      onPressed: (){
        signIn();
      },
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            Center(child: Text('Please enter your data to continue',style: TextStyle(color: Color(0xFF8F959E),fontSize: 15),)),
            Spacer(),
            AppTextFormField(
                title: 'Email address',
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your Email';
                }
                return null;
              },
            ),
            AppTextFormField(
                title: 'Password',
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(''),
                Text('Forgot password?',style: TextStyle(color: Colors.red,fontSize: 15),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Remember me',style: TextStyle(color: Color(0xFF8F959E)),),
                Switch(
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: Colors.green,
                    activeThumbColor: Colors.white,
                    value: isSwitched, onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                }
                ),
              ],
            ),
            Spacer(),
            RichTextButton(textOne: '', textTwo: 'By connecting your account confirm that you agree\nwith our', textButton: 'Term and Condition')
          ],
        ),
      ),
    );
  }
}