import 'package:flutter/material.dart';
import 'package:homzes_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homzes',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
