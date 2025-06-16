import 'package:bluestar_ac_app/models/ac_model.dart';
import 'package:bluestar_ac_app/pages/common/ac_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/common/onboarding.dart';
import 'pages/common/login.dart';
import 'pages/common/home.dart';
import 'pages/more_options/contact_us.dart';
import 'pages/more_options/about.dart';

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool loggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(initialRoute: loggedIn ? '/' : '/onboarding'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, mode, __) => MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: mode,
        title: 'BlueStar App',
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: generateRoute,
      )
    );
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomePage(themeNotifier: themeNotifier));
    case '/onboarding':
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case '/acPage':
      return MaterialPageRoute(builder: (_) => AcPage(acData: settings.arguments as ACModel));
    case '/contactUs':
      return MaterialPageRoute(builder: (_) => const ContactUsPage());
    case '/about':
      return MaterialPageRoute(builder: (_) => const AboutPage());
    default:
      return MaterialPageRoute(builder: (_) => HomePage(themeNotifier: themeNotifier));
  }
}