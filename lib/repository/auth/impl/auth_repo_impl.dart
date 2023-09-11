import 'package:ecommerce/api/model/response/RegisterResponse.dart';
import 'package:ecommerce/api/model/response/loginResponse.dart';
import 'package:ecommerce/repository/auth/auth_repo_contract.dart';

// Implementation for View Model Interface Abstract Class AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<String?> login(String email, String password) async {
    // TODO: implement login
    // throw UnimplementedError();
    LoginResponse loginResponse =
        await authRemoteDataSource.login(email, password);
    return loginResponse.token;
  }

  @override
  Future<String?> register(String name, String email, String password,
      String passwordConfirm, String phone) async {
    // TODO: implement register
    // throw UnimplementedError();
    RegisterResponse registerResponse = await authRemoteDataSource.register(
        name, email, password, passwordConfirm, phone);
    return registerResponse.token;
  }
}
