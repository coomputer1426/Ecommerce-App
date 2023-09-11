import 'package:ecommerce/api/api_manager_repository.dart';
import 'package:ecommerce/api/model/response/RegisterResponse.dart';

import 'package:ecommerce/api/model/response/loginResponse.dart';

import '../auth_repo_contract.dart';

// Implementation for Api Manager Interface Abstract Class AuthRemoteDataSource
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManagerRepo apiManagerRepo;

  AuthRemoteDataSourceImpl(this.apiManagerRepo);

  @override
  Future<LoginResponse> login(String email, String password) async {
    // TODO: implement login
    // throw UnimplementedError();
    LoginResponse loginResponse =
        await apiManagerRepo.login(email: email, password: password);
    return loginResponse;
  }

  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String passwordConfirm, String phone) async {
    // TODO: implement register
    // throw UnimplementedError();
    RegisterResponse registerResponse = await apiManagerRepo.register(
        name: name,
        email: email,
        password: password,
        rePassword: passwordConfirm,
        phone: phone);
    return registerResponse;
  }
}
