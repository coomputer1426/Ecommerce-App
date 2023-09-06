import 'package:ecommerce/ui/register/register_navigator.dart';
import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
// import '../DialogUtils.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterNavigator? navigator;

  void register(
      {required String name,
      required String password,
      required String passwordConfirm,
      required String phone,
      required String email}) async {
    // DialogUtils.showLoading(context, "Loading, Pls Wait ...");
    // DialogUtils.showLoading("Loading, Pls Wait ...");
    navigator!.showMessage("Loading, Pls Wait ...");
    try {
      var response = await ApiManager.register(
          name: name,
          email: email,
          phone: phone,
          password: password,
          rePassword: passwordConfirm);
      // debugPrint("Message : ${response.message}");
      if (password == passwordConfirm) {
        debugPrint("Equal");
      }
      debugPrint("Password : $password");
      debugPrint("Password Confirm : $passwordConfirm");
      // debugPrint("Status Message : ${response.statusMsg}");

      if (navigator!.unMounted()) return;
      // DialogUtils.hideDialog(context);
      navigator?.hideDialog();
      if (response.errors != null || response.statusMsg == "fail") {
        if (navigator!.unMounted()) return;
        // DialogUtils.showMessage(context, response.mergeErrors(), posActionTitle: "OK");
        navigator?.showMessage(response.mergeErrors(), posActionTitle: "OK");
        return;
      }
      if (navigator!.unMounted()) return;
      // DialogUtils.showMessage(context, (response.message == "success")?"The User ${response.user?.name} has been registered Successfully":"${response.message?? ""} ${response.statusMsg??""}" , posActionTitle: "OK");
      navigator?.showMessage(
          (response.message == "success")
              ? "The User ${response.user?.name} has been registered Successfully"
              : "${response.message ?? ""} ${response.statusMsg ?? ""}",
          posActionTitle: "OK");
    } catch (e) {
      // DialogUtils.hideDialog(context);
      navigator?.hideDialog();
      navigator?.showMessage("Error  ${e.toString()}", posActionTitle: "OK");
    }
  }
}
