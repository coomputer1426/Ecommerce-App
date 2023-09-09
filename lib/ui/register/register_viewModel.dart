import 'package:ecommerce/ui/register/register_navigator.dart';
import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../provider/app_config_provider.dart';
// import '../DialogUtils.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterNavigator? navigator;
  AppConfigProvider? configProvider;

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
      // debugPrint("Status Message : ${response.statusMsg}");

      if (navigator!.unMounted()) return;
      // DialogUtils.hideDialog(context);
      navigator?.hideDialog();
      // if (response.errors != null || response.statusMsg == "fail") {
      // No errors in new API
      if (response.statusMsg == "fail" || response.message == "fail") {
        if (navigator!.unMounted()) return;
        // DialogUtils.showMessage(context, response.mergeErrors(), posActionTitle: "OK");
        navigator?.showMessage(response.mergeErrors(), posActionTitle: "OK");
        debugPrint("Password Confirm : $passwordConfirm");
        return;
      }
      if (navigator!.unMounted()) return;
      // DialogUtils.showMessage(context, (response.message == "success")?"The User ${response.user?.name} has been registered Successfully":"${response.message?? ""} ${response.statusMsg??""}" , posActionTitle: "OK");
      navigator?.showMessage(
          // (response.message == "success")
          //     ? "The User ${response.user!.name} has been registered Successfully"
          //     : "${response.message ?? ""} ${response.statusMsg ?? ""}" "\n"
          //     "Token: ${response.token}",
          "Successful Login",
          posActionTitle: "OK", posAction: () {
        configProvider?.updateToken(response.token);
        navigator?.gotoHome();
      });
    } catch (e) {
      // DialogUtils.hideDialog(context);
      // navigator?.hideDialog();
      navigator?.showMessage("Error  ${e.toString()}", posActionTitle: "OK");
    }
  }
}
