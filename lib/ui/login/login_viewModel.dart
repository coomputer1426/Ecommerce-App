import 'package:ecommerce/ui/login/login_navigator.dart';
import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../DialogUtils.dart';

class LoginViewModel extends ChangeNotifier {
  LoginNavigator? navigator;

  void login(String email, String password) async {
    // DialogUtils.showLoading( context ,"Loading, Pls Wait ...");
    navigator?.showProgressDialog("Loading, Pls Wait ...");
    try {
      var response = await ApiManager.login(
        // name: nameController.text,
        email: email,
        // phone: phoneController.text,
        password: password,
        // rePassword: repasswardConfirmationController.text
      );

      if (navigator!.unMounted()) return;
      // DialogUtils.hideDialog(context);
      navigator?.hideDialog();
      if (response.statusMsg == "fail" || response.message != "success") {
        // if (!mounted) return;
        if (navigator!.unMounted()) return;
        // DialogUtils.showMessage(context, response.mergeErrors(), posActionTitle: "OK");
        navigator?.showMessage(response.mergeErrors(), posActionTitle: "OK");
        return;
      }
      // if (!mounted) return;
      if (navigator!.unMounted()) return;
      navigator?.showMessage(
          "Login Operation Result : ${response.message!} \n Press OK",
          posActionTitle: "OK");
    } catch (e) {
      // DialogUtils.hideDialog(context);
      navigator?.hideDialog();
      // DialogUtils.showMessage(context, "Error  ${e.toString()}", posActionTitle: "OK");
      navigator?.showMessage("Error  ${e.toString()}", posActionTitle: "OK");
    }
  }
}
