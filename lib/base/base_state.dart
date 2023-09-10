import 'package:ecommerce/base/base_navigator.dart';
import 'package:ecommerce/base/base_viewModel.dart';
import 'package:flutter/material.dart';

import '../ui/DialogUtils.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void hideDialog() {
    // TODO: implement hideDialog
    DialogUtils.hideDialog(context);
  }

  @override
  bool unMounted() {
    return (!mounted);
  }

  @override
  void showProgressDialog(String progressMessage) {
    // TODO: implement showProgressDialog
    DialogUtils.showLoading(context, progressMessage);
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool dismissible = true}) {
    // TODO: implement showMessage
    DialogUtils.showMessage(
      context,
      message,
      posActionTitle: posActionTitle,
      posAction: posAction,
      negActionTitle: negActionTitle,
      negAction: negAction,
    );
  }
}
