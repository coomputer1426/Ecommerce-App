import 'package:ecommerce/base/base_viewModel.dart';
import 'package:ecommerce/provider/app_config_provider.dart';
import 'package:ecommerce/repository/auth/auth_repo_contract.dart';
import 'package:ecommerce/repository/auth/impl/auth_remote_datasource_impl.dart';
import 'package:ecommerce/repository/auth/impl/auth_repo_impl.dart';

// import 'package:ecommerce/ui/login/login_navigator.dart';
import 'package:ecommerce/ui/login_mvvm_centered/login_navigator_Centered.dart';
// import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../api/api_manager_repository.dart';
// import '../DialogUtils.dart';

// class LoginViewModelMVVMCentered extends ChangeNotifier {
class LoginViewModelCenteredRepo
    extends BaseViewModel<LoginNavigatorMvvMCentered> {
  // LoginNavigator? navigator;
  AppConfigProvider? configProvider;
  late AuthRepository authRepository;
  late AuthRemoteDataSource authRemoteDataSource;
  late ApiManagerRepo apiManagerRepo;

  LoginViewModelCenteredRepo() {
    apiManagerRepo = ApiManagerRepo();
    authRemoteDataSource = AuthRemoteDataSourceImpl(apiManagerRepo);
    authRepository = AuthRepositoryImpl(authRemoteDataSource);
  }

  void login(String email, String password) async {
    // DialogUtils.showLoading( context ,"Loading, Pls Wait ...");
    navigator?.showProgressDialog("Loading, Pls Wait ...");
    try {
      // var response = await ApiManager.login(
      var token = await authRepository.login(
        // name: nameController.text,
        email,
        // phone: phoneController.text,
        password,
        // rePassword: repasswardConfirmationController.text
      );
      if (navigator!.unMounted()) return;
      navigator?.hideDialog();
      // if (response.statusMsg == "fail" || response.message != "success") {
      if (token == null) {
        // if (!mounted) return;
        if (navigator!.unMounted()) return;
        // navigator?.showMessage(response.mergeErrors(), posActionTitle: "OK");
        navigator?.showMessage("Unable to Login, Wrong email or password",
            posActionTitle: "OK");
        return;
      }
      if (navigator!.unMounted()) return;
      // Successful Login
      navigator?.showMessage(
          // "Login Operation Result : ${response.message!} \n"
          //     "Email ${response.user?.name} \n  Token: ${response.token} Press OK",
          "Successful Login",
          posActionTitle: "OK", posAction: () {
        // configProvider?.updateToken(response.token);
        configProvider?.updateToken(token);
        // Navigate to Home
        navigator?.gotoHome();
      }, dismissible: false);
    } catch (e) {
      // DialogUtils.hideDialog(context);
      navigator?.hideDialog();
      // DialogUtils.showMessage(context, "Error  ${e.toString()}", posActionTitle: "OK");
      navigator?.showMessage("Error  ${e.toString()}", posActionTitle: "OK");
    }
  }
}
