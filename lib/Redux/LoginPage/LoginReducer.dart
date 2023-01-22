import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Redux/LoginPage/LoginActions.dart';
import 'package:vet_pass/Redux/LoginPage/LoginState.dart';

Reducer<int> isLoggedReducer = combineReducers([
  TypedReducer<int, LoggedAction>(_isLogged),
  TypedReducer<int, LoginAction>(_isLogin),
]);

int _isLogin(int value, LoginAction action) => 0;
int _isLogged(int value, LoggedAction action) {
  return action.isLogged;
}

Reducer<String> loginReducer = combineReducers([
  TypedReducer<String, SetLoginAction>(_setLoginText),
]);

String _setLoginText(String text, SetLoginAction action)  {
  return action.login;
}


Reducer<String> passwordReducer = combineReducers([
  TypedReducer<String, SetPasswordAction>(_setPasswordText),
]);

String _setPasswordText(String text, SetPasswordAction action) => action.password;