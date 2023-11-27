part of 'login_cubit.dart';

class LoginState {
  LoginStatus loginStatus;

  LoginState({required this.loginStatus});

  LoginState copyWith({
    LoginStatus? newLoginStatus,
  }) {
    return LoginState(loginStatus: newLoginStatus ?? loginStatus);
  }
}
