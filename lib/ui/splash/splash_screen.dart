import 'dart:async';

import 'package:ecommerce/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/ui/register/register_screen.dart';

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      // Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
      // Navigator.of(context).pushReplacementNamed(
      //     PageRouteBuilder(pageBuilder: (context, animation, secAnimation)=>
      //     const LoginScreen(), transitionsBuilder: (context, animation, secAnimation, child){return child;
      //
      // }
      // ));
      // Navigator.of(_scaffoldKey.currentContext!).pushReplacementNamed(LoginScreen.routeName);
      Navigator.of(navigatorKey.currentContext!)
          .pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      // key: _scaffoldKey,
      body: Image.asset(
        "assets/images/splash_screen.png",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.fill,
      ),
    );
  }
}
