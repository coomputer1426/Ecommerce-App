import 'package:ecommerce/api/api_manager_repository.dart';
import 'package:ecommerce/base/base_viewModel.dart';
import 'package:ecommerce/repository/auth/auth_repo_contract.dart';
import 'package:ecommerce/repository/auth/impl/auth_remote_datasource_impl.dart';
import 'package:ecommerce/repository/auth/impl/auth_repo_impl.dart';

// import 'package:ecommerce/ui/register/register_navigator.dart';
import 'package:ecommerce/ui/register_mvvm_centered/register_navigator_centered.dart';
import 'package:flutter/material.dart';

// import '../../api/api_manager.dart';
import '../../provider/app_config_provider.dart';
// import '../DialogUtils.dart';

// class RegisterViewModel extends ChangeNotifier {
class RegisterViewModelCenteredRepo
    extends BaseViewModel<RegisterNavigatorCentered> {
  // RegisterNavigator? navigator;
  AppConfigProvider? configProvider;
  late AuthRepository authRepository;
  late AuthRemoteDataSource authRemoteDataSource;
  late ApiManagerRepo apiManagerRepo;

  RegisterViewModelCenteredRepo() {
    apiManagerRepo = ApiManagerRepo();
    authRemoteDataSource = AuthRemoteDataSourceImpl(apiManagerRepo);
    authRepository = AuthRepositoryImpl(authRemoteDataSource);
  }

  void register(
      {required String name,
      required String password,
      required String passwordConfirm,
      required String phone,
      required String email}) async {
    // DialogUtils.showLoading(context, "Loading, Pls Wait ...");
    // DialogUtils.showLoading("Loading, Pls Wait ...");
    navigator!.showMessage("Registering, Pls Wait ...");
    try {
      // var response = await ApiManager.register(
      var token = await authRepository.register(
        name,
        email,
        password,
        passwordConfirm,
        phone,
      );
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
      // if (response.statusMsg == "fail" || response.message == "fail") {
      if (token == null) {
        if (navigator!.unMounted()) return;
        // Register Fail
        navigator?.showMessage("Register Failed Pls Try Again",
            posActionTitle: "OK");

        return;
      }
      if (navigator!.unMounted()) return;
      // DialogUtils.showMessage(context, (response.message == "success")?"The User ${response.user?.name} has been registered Successfully":"${response.message?? ""} ${response.statusMsg??""}" , posActionTitle: "OK");
      navigator?.showMessage(
          // (response.message == "success")
          //     ? "The User ${response.user!.name} has been registered Successfully"
          //     : "${response.message ?? ""} ${response.statusMsg ?? ""}" "\n"
          //     "Token: ${response.token}",
          "Successful Registration",
          posActionTitle: "OK", posAction: () {
        // configProvider?.updateToken(response.token);
        configProvider?.updateToken(token);
        navigator?.gotoHome();
      });
    } catch (e) {
      // DialogUtils.hideDialog(context);
      // navigator?.hideDialog();
      navigator?.showMessage("Error  ${e.toString()}", posActionTitle: "OK");
    }
  }
}
