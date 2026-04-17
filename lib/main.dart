import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/presentation/google_auth_screen.dart';
import 'package:marketplace/feature/auth/presentation/new_password_screen.dart';
import 'package:marketplace/feature/auth/presentation/onbording.dart';
import 'package:marketplace/feature/auth/presentation/sign_in_screen.dart';
import 'package:marketplace/feature/auth/presentation/sign_up_screen.dart';
import 'package:marketplace/feature/auth/presentation/splashScreen.dart';
import 'package:marketplace/feature/auth/presentation/verification_screen.dart';
import 'package:marketplace/feature/auth/widgets/auth_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Test.dart';
import 'feature/auth/presentation/forgot_password_screen.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://tamxjieyqnmkbydblmtr.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRhbXhqaWV5cW5ta2J5ZGJsbXRyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzYyMjkwMDcsImV4cCI6MjA5MTgwNTAwN30.XSvgtU18R2mdnhib9Yiz55FejyIEw07ejSY7LgYVoLM'
  );


  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => Splashscreen(),
        '/register': (context) => SignUpScreen(),
        '/login': (context) => SignInScreen(),
        '/home': (context) => HomeScreen(),
      },
     // home: SignInScreen(),
    );
  }
}