import 'package:ecommerce/api/model/response/RegisterResponse.dart';
import 'package:ecommerce/api/model/response/loginResponse.dart';

// Interface to View Model
abstract class AuthRepository {
  Future<String?> login(String email, String password);

  Future<String?> register(String name, String email, String password,
      String passwordConfirm, String phone);
}

// Interface to Api Manager
abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String email, String password);

  Future<RegisterResponse> register(String name, String email, String password,
      String passwordConfirm, String phone);
}
