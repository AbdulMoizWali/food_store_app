import 'dart:async';

import 'package:food_store/login/api/login_api.dart';
import 'package:food_store/utilities/exceptions/authentication_exception.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository({required LoginApi loginApi}) : _loginApi = loginApi;

  final LoginApi _loginApi;
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _loginApi.login(email, password);
      _controller.add(AuthenticationStatus.authenticated);
    } catch (e) {
      if (e.runtimeType == AuthenticationException) {
        _controller.add(AuthenticationStatus.unauthenticated);
        rethrow;
        // final ae = e as AuthenticationException;
        // logger.e(ae.message);
        // throw AuthenticationException(ae.message);
      }
      _controller.add(AuthenticationStatus.unauthenticated);
    }
    // await Future.delayed(
    //   const Duration(milliseconds: 300),
    //   () => _controller.add(LoginStatus.authenticated),
    // );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
