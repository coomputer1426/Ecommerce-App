import 'package:ecommerce/provider/app_config_provider.dart';
import 'package:ecommerce/ui/home/home_screen.dart';
import 'package:ecommerce/ui/login/login_screen.dart';
import 'package:ecommerce/ui/login_mvvm_centered/login_screen_mvvm_base.dart';
import 'package:ecommerce/ui/register/register_screen.dart';
import 'package:ecommerce/ui/register_mvvm_centered/register_screen_mvvm_centered.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'ui/login/login_screen_provider_mvvm.dart';
import 'ui/register/register_screen_mvvm.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => AppConfigProvider(), child: const MyApplication()));
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
        LoginScreenMVVM.routeName: (_) => const LoginScreenMVVM(),
        RegisterScreenMVVM.routeName: (_) => const RegisterScreenMVVM(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        LoginScreenMVVMBase.routeName: (_) => const LoginScreenMVVMBase(),
        RegisterScreenMVVMCentered.routeName: (_) =>
            const RegisterScreenMVVMCentered(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
