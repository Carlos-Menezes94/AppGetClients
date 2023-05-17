import '../../../../core/response.dart';

abstract class AuthDataSourceAbstract {
  Future<DataSourceResponse> logout();
  Future<DataSourceResponse> login({required String password, required String email});
  Future<DataSourceResponse> registerUser({required String password,required String email});
}
