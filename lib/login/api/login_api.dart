import 'package:food_store/utilities/api/api.dart';
import 'package:food_store/utilities/exceptions/authentication_exception.dart';
import 'package:food_store/utilities/logger/logger.dart';

class LoginApi extends Api {
  // LoginApi() {
  // dio.options.baseUrl = '${Config.apiURL}/api/users/login';
  // }

  /// Login with [email] and [password].
  /// throw [AuthenticationException] if login fails.
  Future<void> login(String email, String password) async {
    try {
      final response = await dio.post('/users/login');
      if (response.statusCode != 200) {
        throw AuthenticationException(response.data['message']);
      }
      logger.d(response.data);
    } catch (e) {
      throw const AuthenticationException('Something went wrong');
    }
    // return username == 'admin' && password == 'admin';
  }
}
