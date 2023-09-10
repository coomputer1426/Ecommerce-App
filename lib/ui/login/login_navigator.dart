// import 'package:ecommerce/base/base_navigator.dart';
import 'package:flutter/material.dart';

abstract class LoginNavigator {
  void hideDialog(// if (!mounted) return;

      );

  bool unMounted();

  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool dismissible = true});

  void showProgressDialog(String progressMessage);

  void gotoHome() {}
}
