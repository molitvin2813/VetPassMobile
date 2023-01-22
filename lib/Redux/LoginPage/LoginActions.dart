import 'dart:convert';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Redux/LoginPage/LoginState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';

import '../SelectAnimalPage/SelectAnimalActions.dart';

class SetLoginAction {
  final String login;

  SetLoginAction(this.login);
}

class SetPasswordAction {
  final String password;

  SetPasswordAction(this.password);
}

class LoginAction {}

class LoggedAction {
  final int isLogged;

  LoggedAction(this.isLogged);
}

ThunkAction<AppState> loginThunkAction = (Store store) async {
  store.dispatch(LoginAction());
  _login(store.state, store)
      .then((value) => store.dispatch(LoggedAction(value)));
};

Future<int> _login(AppState state, Store store) async {
  token = "";
  role = -1;
  int result = 0;
  var client = http.Client();
  try {
    var response = await http.post(
      Uri.parse('${baseUrlApi}users/login/client'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'login': state.loginState.login,
        'password': state.loginState.password,
      }),
    );
    if (response.statusCode != 401) {
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      token = decodedResponse['token'];
      role = decodedResponse['role'];
      idClient = decodedResponse['idUser'];
      result = 1;

      store.dispatch(NavigateToAction.push("/selectAnimal",
          preNavigation: () {
            store.dispatch(getAnimalListThunkAction(store as Store<AppState>));
          }));
    }
  } finally {
    client.close();
  }
  return result;
}
