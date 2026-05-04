import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketplace/Test.dart';
import 'package:marketplace/feature/auth/presentation/onbording.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),(){
      _redirect();
    });
  }

  void _redirect() async {
    try {
      final session = await Supabase.instance.client.auth.currentSession;

      if(!mounted) return;

      if (session != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }else {
        Navigator.pushReplacementNamed(context, '/Onboarding');
      }
    } catch (e) {
      if(!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/LogoLaza.png'),
      ),
    );
  }
}
