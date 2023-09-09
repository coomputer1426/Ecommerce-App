import 'package:flutter/material.dart';

abstract class RegisterNavigator {
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
