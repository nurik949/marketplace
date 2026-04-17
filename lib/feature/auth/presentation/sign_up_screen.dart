import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/widgets/auth_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../Test.dart';
import '../widgets/app_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final SupabaseClient client = Supabase.instance.client;
  final _key = GlobalKey<FormState>();

  bool isSwitched = false;

  void signUp() async {
    try {
      if (_key.currentState!.validate()) {
        final response = await client.auth.signUp(
          password: passwordController.text,
          email: emailController.text,
        );

        if (response.user != null && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(backgroundColor: Colors.green,
              content: Text('Регистрация прошла успешна')));
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
          backgroundColor: Colors.red, content: Text('Ошибка Регистрации')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBody1(
        title: 'Sign Up',
        textButton: 'Sign Up',
        onPressed: (){
          signUp();
        },
        body: Form(
          key: _key,
          child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                children: [
          AppTextFormField(
              title: 'Username',
              controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
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
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Remember me',style: TextStyle(color: Color(0xFFF5F8FB)),),
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
                ],
              ),
        ),
    );
  }
}