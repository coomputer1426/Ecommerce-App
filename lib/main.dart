import 'package:ecommerce/ui/login/login_screen.dart';
import 'package:ecommerce/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/ui/splash/splash_screen.dart';
import 'ui/login/login_screen_provider_mvvm.dart';
import 'ui/register/register_screen_mvvm.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Color(0xff004182), elevation: 0),
        primaryColor: const Color(0xff004182),
        scaffoldBackgroundColor: const Color(0xff004182),
      ),
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
