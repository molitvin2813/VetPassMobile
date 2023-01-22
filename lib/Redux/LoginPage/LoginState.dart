import 'package:flutter/cupertino.dart';

@immutable
class LoginState {
  final String login;
  final String password;
  final int isLogged;

  const LoginState(
      {required this.login, required this.password, required this.isLogged});

  const LoginState.initialState()
      : login = "",
        password = "",
        isLogged = 0;
}
