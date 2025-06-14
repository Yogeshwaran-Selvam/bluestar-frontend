import 'package:flutter/material.dart';

import 'pages/onboarding.dart';
import 'pages/login.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlueStar App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      onGenerateRoute: generateRoute,
    );
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case '/onboarding':
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginPage());
    default:
      return MaterialPageRoute(builder: (_) => const HomePage());
  }
}