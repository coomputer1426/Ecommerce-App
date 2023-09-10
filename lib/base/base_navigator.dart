import 'dart:ui';

abstract class BaseNavigator {
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
}
