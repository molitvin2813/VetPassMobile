import 'dart:convert';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Model/ClientModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Redux/LoginPage/LoginState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';

import '../SelectAnimalPage/SelectAnimalActions.dart';

class SetClientAction {
  final ClientModel client;
  SetClientAction(this.client);
}

class SetClientFIOAction{
  final String fio;
  SetClientFIOAction(this.fio);
}

class SetClientEmailAction{
  final String email;
  SetClientEmailAction(this.email);
}

class SetClientPasswordAction{
  final String password;
  SetClientPasswordAction(this.password);
}

class SetClientLoginAction{
  final String login;
  SetClientLoginAction(this.login);
}

class SetClientPhoneAction{
  final String phone;
  SetClientPhoneAction(this.phone);
}

class ResetClientAction{}

class RegisteredAction {
  final int isRegistered;
  RegisteredAction(this.isRegistered);
}

class RegisterResetAction{}

ThunkAction<AppState> registerThunkAction = (Store store) async {
  _register(store.state, store).then((value) => store.dispatch(RegisteredAction(value)));
};

Future<int> _register(AppState state, Store store) async {
  token = "";
  role = -1;
  int result = 0;
  var client = http.Client();
  try {
    var response = await http.post(
      Uri.parse('${baseUrlApi}users/register/client'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(state.registrationState.client.toJson()),
    );
    if(response.statusCode != 401){
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