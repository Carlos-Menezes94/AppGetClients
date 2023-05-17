import 'package:app_menezes/core/response.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_data_source_abstract.dart';

class AuthDataSourceImpl implements AuthDataSourceAbstract {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<DataSourceResponse> logout() async {
    await auth.signOut();
    if (auth.currentUser == null) {
      return DataSourceResponse(data: "", success: true);
    } else {
      return DataSourceResponse(data: "", success: false);
    }
  }

  @override
  Future<DataSourceResponse> registerUser(
      {required String password, required String email}) async {
    final response = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (response.user != null) {
      return DataSourceResponse(data: response.user, success: true);
    } else {
      return DataSourceResponse(data: response.user, success: false);
    }
  }

  @override
  Future<DataSourceResponse> login(
      {required String password, required String email}) async {
    final response =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (response.user != null) {
      return DataSourceResponse(data: response.user, success: true);
    } else {
      return DataSourceResponse(data: response.user, success: false);
    }
  }
}
