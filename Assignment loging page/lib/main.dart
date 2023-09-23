import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/onboarding_screen.dart';
import 'package:onboarding_screen/sign_in/sign_in.dart'; 

// flutter pub add google_fonts = to install font from google

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'On boarding Screen',
      theme: ThemeData.light(useMaterial3: true),
      home: const OnBoardingScreen(),
      // home: SignInScreen(),
    );
  }
}